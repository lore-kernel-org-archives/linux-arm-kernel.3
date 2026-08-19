Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7471C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdNvXJp3fYWDb4AeWrNS2N9ptcm8b/tF0m0nP1jqz2c=; b=mE8jq4MbjAItTBD6CM4UBjS5py
	mf/08/xSDFxoTfhBxPMLtkARqqiCfh450x4Zhs4TwhixtzEyXRyOKuU/nYNsktxcRHxH2htO26gFN
	+i5P0ySviKkjlczatI2zp8miBeh1Ygu7G0C13puqt2PZ3FUfcuXtlc/K88aWasf9Cdg2XIGWl/s5W
	ExvS+b3I8D83fM6YS8iB9XM2J8gHfBfTKwCtuEaQenhnRleaig0zZxN98EdII2b76pIHc1kfzDPLD
	+s1lfZ16kRkdmdbbn5wfXgZAoB2nAP9eoXT4T6ha418AV3j1fEqWoGmE0a/0XE+qsOMVZnz2YRozR
	Mz6cvT6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwj44-0000000AAra-1ysh;
	Wed, 19 Aug 2026 16:22:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwj42-0000000AAr2-1H0O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:22:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1A0I3869628
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 16:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zdNvXJp3fYWDb4AeWrNS2N9ptcm8b/tF0m0nP1jqz2c=; b=X+/fJX6uFXJ/C5IE
	mH+lU7cavZEfKpJlQsX58EJcAjQPP1MMkLhq95kufJs1buOEcPVKSAeiXSE7/tlc
	7hxopYU8Ky+Fpe/rjrO49Voc0QO5hDywi+kM+f6YDEv6ynwZLvq3YNRXyQ4wfnzn
	g0ah5Q5XkJxKbRwpenNlsosV8qV34/jp2uea1Sc6HQiiuXwi5wUwBI/z7LvtP0yE
	G4ZFBXrCKwgbGP1/TOB1wzyzqM1xAW7b6uPJVKde8CnsVx1PKuM6PC9QQtk53FWH
	ZpDagyTQbICqAFL6nkOgKGMa0yxHdvEmQkogEi6oQ16ZGnF7yd9ZI/z8LQc4CnPY
	1yEoRQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervgffd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 16:22:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce14a21faso1011745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 09:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787156573; x=1787761373; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zdNvXJp3fYWDb4AeWrNS2N9ptcm8b/tF0m0nP1jqz2c=;
        b=dTSh55YvGtE22VCYJJSWtErfmmX0Wxsew7DyCp1zew39n1e63z6co365uL8Ogucluh
         9x7hEH84zv2ZfYnhcingTI8Zse0U0apedKPCTxlWyUb46eRPwvq/eu8uYnFvy0AsWl5i
         mIpwPhr09QrFLFJB3zSaGji8ydK+kcUEeLkslDQzddde0D0q7c6KMKERzoDQDwZ57C9X
         0p7G4hd7vu6kcWjC28oWCcRjHUm7XUsDn8Z5DarRYtz3t2y+HMvrE/d/S8iBk3F5hn37
         ekQ6DjH1gL1hz+E1WTc3bmJ7bGVaGb8vK2iUMBFbxAIBujIZAm4tHQwYK+jH4S2VkbwM
         IFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787156573; x=1787761373;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdNvXJp3fYWDb4AeWrNS2N9ptcm8b/tF0m0nP1jqz2c=;
        b=kfBObasvy7/+6L7jZSuquckygBPcxi/jRVOLmzoP6wyYOqcBBuRG0edQo8xl/9UfrI
         TA2yW0Bj8Pj3zbShax9jL+ZSA27zeaeODTuEY9Vn9ijxZYw381GbGWoP9zB1MkJMFAGj
         BFrEa2eI1Jf4KGrfm8JyeMfn0uXike4OcgQ00bAD7k/clFq8+cy61rT27/Rc1ZPlaf8w
         NyqlCYxrlTNEWcgucl+cewt+e2Mok/e4CcjZAqdoTK6UYIEmYMQdS3Xpc5PgsslWpa7W
         IZ+foX7B/byJPhyke0tyoLN97OX1j/TAS/Ji8WCU/8Nct9wQMlWOoVpMGd0OAiFoZcG6
         c1Mw==
X-Forwarded-Encrypted: i=1; AHgh+RoURkW8IZdrzt+G7ryKmcPRJs8l8aXyWxxN4io3yPxQ2YhQRrfhLojRSPccHr2R1O21J3srwq4Go1AdiEfx9Ikq@lists.infradead.org
X-Gm-Message-State: AFuF++kD+uB+ajYlYM4WjW/0dd3sNmqVJxSIqEMexb7pJKafS5vhCllR
	6hT8fZlWMAuUquZr43eZiNoh8Hl4Tzz6dI+Ex5IwfYJskYO+yvWqwW/C0nbAVDUPNS8RMQxeNwo
	oHeJGhvinVx2CipGruqnkaTPKUd83PV0MFCw03WU6AOj1c6Pk+KCqDbs8QNrPPshQlm/nUPc6u1
	abspjBlKFw6w==
X-Gm-Gg: AR+sD10jGNpMRQgoO+0lU+wbxDVcgIWGzVbqxfDgS3Iq95wj9mGRMjKvAL8zibHkcVJ
	GIkw3KYCpxfJLUWJDTl81MXr9m3oCeIXzRKjJ+2ZU36lI6dl+YJT5/2AMvmQGbJ8CuPav5gWyoi
	v9tkFWIAAPAQ7qAvVuEV6rFzuiJsKAxAw9ohXFScU4zzfr/PxZxF97PNzGuukR0ZfIVP7PEb5qZ
	Dg7CecP9gGJlAZjUG65Owz2ldBc1wLWZ7aF2G+yPe7wrgwlvluPY4qFRmXGpxdqvbIOCien7ski
	R3QEJE6F3hv/Xz8nw6CQ81OuTQtuJaNQi1RI/NLCK8AOci5WAtIgvTkiKukdLo2QgQgnY8MLpZ+
	3gBaXjAGJrYa9Dz0rUrI8PwWDBw==
X-Received: by 2002:a17:903:468f:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d61a1d22d4mr2876075ad.15.1787156572701;
        Wed, 19 Aug 2026 09:22:52 -0700 (PDT)
X-Received: by 2002:a17:903:468f:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d61a1d22d4mr2875525ad.15.1787156572113;
        Wed, 19 Aug 2026 09:22:52 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef7a0easm9906098eec.12.2026.08.19.09.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:22:51 -0700 (PDT)
Date: Wed, 19 Aug 2026 09:22:45 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Li Jun <lijun01@kylinos.cn>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: pm: use SIMPLE_DEV_PM_OPS for pm
 struct
Message-ID: <20260819092245.0000440d@oss.qualcomm.com>
In-Reply-To: <20260819061530.2391788-1-lijun01@kylinos.cn>
References: <20260819061530.2391788-1-lijun01@kylinos.cn>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e9KakrLBJcgt2qrzNmwQExVBV2wM7ZLd
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a85d85d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QMhJhkxfpb1qmTAqszQA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyNyBTYWx0ZWRfXzidVUbbyeSyu
 uQ3H1qkYgle6rHww/aTwa7C5q3YYJ7HmwsJGi0eO3eZYcU9qSIEGxKoFkk/NQTUgTlz5RllRBIx
 o7TdNIc/Whlnbw9UjpRfX/OnCvIW8BLK9i44d3F5g9aCrxngO5eqrhiLu9SCAdfhFMnGhwArYJb
 mWoF7UmFVlmgnW21xXiABFs4KkAIyH4xHSfwmU9dTHTJMEJU+wKViV7hoZocycqz8AEtmhRMnA0
 UxbkYVxWj9AK/smPRKGz6BN3rWy/2aiNlewayyp5aZ40b0zlvYXNmzwLjRK72ohmVptXThtFkwh
 MXW1gcGqIMDkrBreQSpzUsY1aUW+W9YST3q0msq41eo3NlhxvgfwBcEE3mt3PaDXSFgA/4vRRV8
 wgOqn6ZHHbhytjpTiZk/mkA03DAXm1y5kdP3gmdgwZcwcR2naqivcIRO1q1yeYtmiKyAfK/FUoD
 74F9JWk81UamwoNmNVA==
X-Proofpoint-ORIG-GUID: e9KakrLBJcgt2qrzNmwQExVBV2wM7ZLd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyNyBTYWx0ZWRfX50NQDzRo8wRF
 ksqw7R57kJv3zc0CiLOMVdd9FS8ZH3EiH7KD6FwSmnKMS4aB7hdrbbvOoh20S/S4hXzfF+eATin
 iSWPE0fvKT8YRYGIcDBRHbV5JA+aK7g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_092254_364386_51A8A3FD 
X-CRM114-Status: GOOD (  20.36  )
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

On Wed, 19 Aug 2026 14:15:30 +0800
Li Jun <lijun01@kylinos.cn> wrote:

> use SIMPLE_DEV_PM_OPS for scmi_dev_pm_ops,and add the value of
> .freeze .thaw .poweroff .restore.if these address are null, may cause
> error in s4.
> 
Read the note immediately above the definition of SIMPLE_DEV_PM_OPS

That is slowly going away so I doubt we want to introduce more instances of
it.  So as part of this change, flip to DEFINE_SIMPLE_DEV_PM_OPS()
and make the other changes necessary for that to work correctly

Jonathan


> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  drivers/firmware/arm_scmi/bus.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index e060edbe7e83..4ab32f1eed4f 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -13,6 +13,7 @@
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/device.h>
> +#include <linux/pm.h>
>  
>  #include "common.h"
>  
> @@ -361,10 +362,7 @@ static int scmi_pm_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static const struct dev_pm_ops scmi_dev_pm_ops = {
> -	.suspend = pm_sleep_ptr(scmi_pm_suspend),
> -	.resume = pm_sleep_ptr(scmi_pm_resume),
> -};
> +static SIMPLE_DEV_PM_OPS(scmi_dev_pm_ops, scmi_pm_suspend, scmi_pm_resume);
>  
>  const struct bus_type scmi_bus_type = {
>  	.name =	"scmi_protocol",


