Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24713C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 04:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZnm8PUwSbbaRIS2I4Y7DkEdXZ5o/1IW7fPXlQxrNvg=; b=RqYFUHFHw0/5SaCIqOOo0t/kLZ
	MsuXkC6u7yR66tt1zE5IzmcubMTfuHVWeJXXD66z8Pym+g6LXJC+b3NrY/wjHq7G2xMnavNOEwPhH
	keRRMwu8tmBia/ejvDZYpoCtncE0IgANO3ZgyXNGtDyDUC3BpdHucgwa5SAIObsqewftP8FQwAl7y
	VrxT8+QhAw3bgkTjggxEXyaXz39oY+qziG8JnxAVFD/DygIbt0hnvuy64RfEnblzHT5vaWrVVjxk/
	sE0BdiVMOBjTAsIuQ6KHzJVETXlftf6Gp0MbmY+4FL4O5aR+4L9LwJKXIHYwmXy/fVv8oyoMVN7xY
	MfQDY1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tukze-00000007yMh-0aJm;
	Wed, 19 Mar 2025 04:25:26 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tukxx-00000007yAS-0TQT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 04:23:42 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30bfed67e08so69014581fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 21:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742358219; x=1742963019; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZnm8PUwSbbaRIS2I4Y7DkEdXZ5o/1IW7fPXlQxrNvg=;
        b=XCdCBTOxJiqubOa85+9P3M+K7KP5jxrGz+PF+y3whlKhfVgiwDPnsgl6jTk5XO5eGJ
         cPI+Pkx7ejETJbV3dHjsw9BXzJZGG7kTZhHCPLvoli6XS8q/OEYgd/xb+YRu1RxMQE26
         b8+LgwE9G8GhV5lYM1O8PANkrDxfccux2lGsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742358219; x=1742963019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZnm8PUwSbbaRIS2I4Y7DkEdXZ5o/1IW7fPXlQxrNvg=;
        b=YLtzNlX/2wCmwaHXKUygjt92jRIHt6ntZF0To1lqV5TDmkbcNu/IikQ5HV9ADLaqDH
         61x+mydAPLUzUhvxzHBNQwYCmNxdN581m0PwAmYHf39o7J25suoBVxYGH0+KYXeHiVmU
         fJcNh5QjDHUB+vmn1764YRtDrT5YTcQ/39UJkMR1/ydm2QIltq3/bRUqI/2zori/ChXc
         ozsAh/3BUXYb42NrrjvV1AfWPMRSKc2RQM+uZMVzn6xm4i7LuixeY7l20QhxztWUauxT
         8ffKu6ahZgyoNaWFxi/y9xnTa00D1FFSPFRDQl1EkJkwi5hMCpXeRE7/qqrEwPhLBWue
         JVTg==
X-Forwarded-Encrypted: i=1; AJvYcCXyeR9lmvGoJkOzoHpjuJvvnRn37ojS3EaaI0NfSNv+r5OTruQQYpr2LMFJQ2di36mMPoAtwflAnYKIL0ln8gQN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz6ysvZeAC4QuwgNr37z6EBABDHHCYXmTmdd5CWj9SLck+HF0d
	SXrjDFEe01jTgsPvi8K3mbZnaN+LKWjVYEBxVob/AkoDpQFxJxMGfp2W4JXdQ6gyLMEC2gV2rID
	pkdaZrUP8lPWgwgYcXCyHTFxSqFICeHpVZvvd
X-Gm-Gg: ASbGncsL09+J+1G8yOEx15M6dE6qkSCTXbVW357h9zZ1rIMoPL4h26kLjN8x6tWtzF0
	DzEEZHOR4hcfSTPh2toeRTJ5/9PMiQi0JssWEHTBZ3rJH7UVGjVkFXxGDWIBmfeWvuquXV0I/jP
	MH1Pac6ChSRobbdOZBriJdQrzRRmndY+4WI+/7VMtzloJWEoLjG48iUA==
X-Google-Smtp-Source: AGHT+IFHjBg03r/3RVZ9aaB5Mk4M+GMF/ZItUsDYbR7cSHqYL8Hm2MnfjLcQTNBGrm46WGoX9JDBGpNCtwc078vB7uE=
X-Received: by 2002:a05:6512:2507:b0:549:3b4f:4b39 with SMTP id
 2adb3069b0e04-54acb195bd5mr361603e87.10.1742358219093; Tue, 18 Mar 2025
 21:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250318102259.189289-1-laura.nao@collabora.com> <20250318102259.189289-2-laura.nao@collabora.com>
In-Reply-To: <20250318102259.189289-2-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Mar 2025 12:23:27 +0800
X-Gm-Features: AQ5f1Jos7SspTJtPnVw7V5hzjUHHfb4ilgg6YTkdTM2SmwYmpJB2tPacgIw_Nsk
Message-ID: <CAGXv+5HZBS-L=BSPcy+QJAwJE--wB1AvG-xnxu+sf1FttYtV=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/chrome: Add support for Google Spherion in
 HW prober
To: Laura Nao <laura.nao@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	bleung@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	nfraprado@collabora.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_212341_176733_BFE06491 
X-CRM114-Status: GOOD (  16.90  )
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

On Tue, Mar 18, 2025 at 6:28=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add a new compatible entry for "google,spherion" to the hardware prober
> platform list, using the same I2C component prober and trackpad data as
> "google,hana".
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/platform/chrome/chromeos_of_hw_prober.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/pl=
atform/chrome/chromeos_of_hw_prober.c
> index c6992f5cdc76..019578bc7ad0 100644
> --- a/drivers/platform/chrome/chromeos_of_hw_prober.c
> +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
> @@ -84,6 +84,10 @@ static const struct hw_prober_entry hw_prober_platform=
s[] =3D {
>                 .compatible =3D "google,hana",
>                 .prober =3D chromeos_i2c_component_prober,
>                 .data =3D &chromeos_i2c_probe_hana_trackpad,
> +       }, {
> +               .compatible =3D "google,spherion",
> +               .prober =3D chromeos_i2c_component_prober,
> +               .data =3D &chromeos_i2c_probe_hana_trackpad,
>         },
>  };
>
> --
> 2.39.5
>
>

