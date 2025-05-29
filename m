Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2754EC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmGQGPLdo98p+w4fo8+0lOvFSw7pzRAfcSN37CALGiE=; b=FyQcG3jPGvNBHO+Z/obSP3vrLB
	+c4+dtFlufeMTLS8Z5NXigekBo2c8J+FTDZifu3QDr87sZLEmGhMX19IEVhoPL7G4rOIbWG5MZ+2+
	cSoik9PC+hU3KJsXn4pLLhpLCxCLgfa0osuesy2ieD4oxuYSuKlL5P7WdaV8BJ/CEcOamF4/970DF
	2f9QczyCFGgOZA1EPsTMxQXIbt5viM/reUi1ZPFTaMO6WeHmhdZ1nCV9eBWGVMCn741PcrAt3fBiP
	MGd6/XY56JrrGby4D5/fOTV0fuPSVEQUGsJ6DukmSJathXORu5yJuf7OQJuF29oB+t6Kzgp67UY05
	jxQvIZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKc7a-0000000Fhzq-0Vfc;
	Thu, 29 May 2025 12:12:30 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbUe-0000000Fd3t-2RJW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:32:17 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7PJG3z5wz6L5kh;
	Thu, 29 May 2025 19:28:30 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1036614022E;
	Thu, 29 May 2025 19:32:07 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 May
 2025 13:32:06 +0200
Date: Thu, 29 May 2025 12:32:04 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Songwei Chai <quic_songchai@quicinc.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Andy Gross
	<agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 4/7] coresight-tgu: Add TGU decode support
Message-ID: <20250529123204.00005b78@huawei.com>
In-Reply-To: <20250529081949.26493-5-quic_songchai@quicinc.com>
References: <20250529081949.26493-1-quic_songchai@quicinc.com>
	<20250529081949.26493-5-quic_songchai@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_043216_760130_9DB9FA8E 
X-CRM114-Status: GOOD (  17.54  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 29 May 2025 16:19:45 +0800
Songwei Chai <quic_songchai@quicinc.com> wrote:

> Decoding is when all the potential pieces for creating a trigger
> are brought together for a given step. Example - there may be a
> counter keeping track of some occurrences and a priority-group that
> is being used to detect a pattern on the sense inputs. These 2
> inputs to condition_decode must be programmed, for a given step,
> to establish the condition for the trigger, or movement to another
> steps.
>=20
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>

> diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtrac=
ing/coresight/coresight-tgu.c
> index 6dbfd4c604b1..8dbe8ab30174 100644
> --- a/drivers/hwtracing/coresight/coresight-tgu.c
> +++ b/drivers/hwtracing/coresight/coresight-tgu.c
> @@ -21,13 +21,35 @@ static int calculate_array_location(struct tgu_drvdat=
a *drvdata,

> +
>  static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
>  		      void *data)
>  {
> +	int ret =3D 0;
=46rom what can be seen here, looks like ret is always set, so no need to ini=
t.
>  	struct tgu_drvdata *drvdata =3D dev_get_drvdata(csdev->dev.parent);
> =20
>  	spin_lock(&drvdata->spinlock);
> @@ -150,11 +264,15 @@ static int tgu_enable(struct coresight_device *csde=
v, enum cs_mode mode,
>  		spin_unlock(&drvdata->spinlock);
>  		return -EBUSY;
>  	}
> -	tgu_write_all_hw_regs(drvdata);
> +	ret =3D tgu_write_all_hw_regs(drvdata);
> +
> +	if (ret =3D=3D -EINVAL)
> +		goto exit;
>  	drvdata->enable =3D true;
> =20
> +exit:
>  	spin_unlock(&drvdata->spinlock);
> -	return 0;
> +	return ret;
>  }

> diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtrac=
ing/coresight/coresight-tgu.h
> index f07ead505365..691da393ffa3 100644
> --- a/drivers/hwtracing/coresight/coresight-tgu.h
> +++ b/drivers/hwtracing/coresight/coresight-tgu.h

>  enum operation_index {
>  	TGU_PRIORITY0,
>  	TGU_PRIORITY1,
>  	TGU_PRIORITY2,
> -	TGU_PRIORITY3
> +	TGU_PRIORITY3,

And here is why the previous patch should definitely have had the ,

> +	TGU_CONDITION_DECODE
> =20
>  };

>=20
>=20


