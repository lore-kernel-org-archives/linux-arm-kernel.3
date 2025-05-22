Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F197BC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGjaJfhABvgVCGsd3tFad+QV9xCQhZ9TN29ZtSgkRyU=; b=RBHZMYnICyML5wPD1gMorl2V+q
	Uig5P/HpNZLNaQ9W8CLtAHYI1gYIMzjJXfpOqd/Ixj/e/edF1+upXaCaDHjF5r/vi9gUD1N80iGKa
	9EyOtDVRVPnPpAlLKIGz3XL4zk/eApCao7xk4Cy6e41aJ+s+TZ7e5lHoSPOJOl7rHg20El7JU20Mu
	nx1zRv90R239VI2X/4Bub+UswgBJRjwg+rljQhKEt9tiy03FV42iGDwOiCDAcCYv/jOKJn2DMWyDt
	DVKFv45feb8DXDn+QbFq5oT2gipaRJeIpmTvyLB2nneXkU/i+fZWcaRM8V5AzydC6k0LrqGxERZuX
	qNR1IPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI75o-00000001I00-2smB;
	Thu, 22 May 2025 14:40:20 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6yB-00000001GPc-0QF0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:32:28 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-551ed0038a0so6418900e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747924344; x=1748529144; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGjaJfhABvgVCGsd3tFad+QV9xCQhZ9TN29ZtSgkRyU=;
        b=l5QOgxUm8M9YC5w77/sJOVULEGuDi8L/mBWQjp+92s8JRkmRXgZU9F7JXGamg7tivO
         fN8EOYSa77vIdWzC0hJq8itRmemasJMFkIzm6mgo/PAoynbbMIW93zvTole3hdTO3WRb
         c20twAfcpQ7Bn46ki7s2pljhUCYURxsDlu02Z8VRV7qsWwurWl+0zZJyWxZUjAi+TLts
         KKwB9U9y7RfX28tOzFGLrp4tW80ziptF72zxE5fBFYazyJcSpisrQO+bbRsTONkUuZI9
         fj/WymJeLJK2e0nnljyHI+QAuafl/76xd+A6b7oFQbPw+az+CCkj0+1a34aIDYu7onGP
         acPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747924344; x=1748529144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGjaJfhABvgVCGsd3tFad+QV9xCQhZ9TN29ZtSgkRyU=;
        b=g2jGd8MTxCI4kcR9ERU6Tm7AymfQP9JVhSXBUpdQeiacc2QscqPPfZHI7n6pp69+kC
         w8LrOTnRlnwq5U30+9vuj/26cL6pUUYRy80l6No0aSq1oUG4WOcIx92g2BMNtgBJEjfe
         YqtiGKVNdp2cBk7mxrtgbwkdgHaXVNJvNCZTrltdWNqZOiOtfszeLByhsM++9RsKj8FD
         8cMwA6Wp0Jg1QBELqiRoUL5nlHZx/d6XtSMWVLc/XyFVbrVAFNiKXHClSHCfUbKZsOXi
         uz9J+CGXAH7KWrcFFCBrMRXtaEZ4TTydFqspmXOOsAsrHy63BSYrov30cK5apO6gg5wY
         D/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy38Rf5VnvQi4f/au8c8LACgJ1kip9vZl+FwPktEeTEZMVVuLngt5hdlp3yGcDVf+NhWCwMVRgOS+gNwNffH4X@lists.infradead.org
X-Gm-Message-State: AOJu0YyaYX4+RkWNkVm5mJPzV6dplu7Cb0YaWeLVsMdQyKfaI7RUAVHW
	82npYP+XD6vh3JCx+mr44iCRK/Ex9SCIVg8xXH6XoZJPVhlsn2AbvfREpbqgrMyXphea/uiOwYL
	0JUHWM8lPYlRUGh8TmIyiXOmx/qsSfoEWqw==
X-Gm-Gg: ASbGncvmldUUfrbuTrdgstnQ6wm4SRNACsd097FiFmq5I9aM1ghq0dGGYVBK0uCwUMf
	bnIJAEla4SsTqTn5GtCV7CGnrlAGUd1E2GxMqgJOZJ2FgSa0cbQvz61Cy7LvMdp51m2cIcovqlt
	tzv6qYPF4+dEw1PmoC4LpdvAoYFItXRoKQVx/KKNQW8Lw/OjSue20uMYg1/wpxNqE=
X-Google-Smtp-Source: AGHT+IEaZE1lp9L8I1XpxLuDmVxE/BSvCemmHIZkmr/5NnE6CTH32YEGW7LlVFpP2G3fc1oPzmkQFN5oJlhNcxT/MYI=
X-Received: by 2002:a2e:a98e:0:b0:308:f860:7c1 with SMTP id
 38308e7fff4ca-328077a3117mr89859901fa.30.1747924344394; Thu, 22 May 2025
 07:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>
In-Reply-To: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 May 2025 11:32:13 -0300
X-Gm-Features: AX0GCFufK1yPw-pz3POhVgPcevjDncZ61EpuRdPKFDM9n9SEGr7Bk_wTDX8Uy3A
Message-ID: <CAOMZO5CDR1LCmmAp0eRFnrC7LNS9WjOaQhRi1RzC_ZU07O4oog@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: Cleanup video device in error path
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_073227_140723_60465A55 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

Hi Daniel,

On Thu, May 22, 2025 at 11:30=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> mxc_isi_v4l2_init() registers video devices and v4l2 subdevices but
> the video devices are not cleaned up in that function's error path
> which means they're left hanging if it fails. Update the function
> to clean them up properly.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

It looks like this deserves a Fixes: tag.

