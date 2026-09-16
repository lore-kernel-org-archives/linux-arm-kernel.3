Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943C1C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6wIAcEKWE9nqg7/k3qdRoBKRXzso0r5nn1/whrKqBA=; b=NpN2ctJZ6xhkSr4EqJtBT5Rw+v
	Ps8KTVKReX5GRxuqLtSiM9KvowL8OCHuNmMTwb7L37StfHqF3kg7OUMSnMniY9MAx5W0MYku4zQIA
	QdN7SZqeN9TL4RI2Iq3J+2EPHp6ijbMN+kPcxOfWXIaCZs6gpQ6aedHY+KL56O9dGQ9YjTapuMf9+
	BqlvVBd5Bmwc2xCrcu0Y91Ng0sn/Ix+XFwU/oRHOpeVnwfZQTce72w020OYiUZXt1544CuMGr+WPh
	ofFoh5SSSGi9MBsTF0zVSZNwFDh6gLVBmWDMHERbbg7GM6/sXj1UBQuoG8++ACAL/xlJrCKaErPsK
	b22lZtuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jsh-00000008ZRd-3xNU;
	Wed, 16 Sep 2026 07:16:35 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jsg-00000008ZQq-0ErD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:16:35 +0000
Received: by mail-pz2-x0e.google.com with SMTP id d2e1a72fcca58-86e6d007703so510216b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789542993; cv=none;
        d=google.com; s=arc-20260327;
        b=Bdasp4qOBvpnrfZWEOyILoH4KZTQNse2IspsNz4esNaG1dy1JEDtjlnhBMXJOCdR95
         S7xYBI9PRzpOhe+MXDS+5sGw57GNnkkMkV+R/xwump+vctnSp78uKesk3IV7AbZtLmPK
         DGuxfrUxFwiVY7/H4imIe1tbBTx6+fxhOeevXMHurhMqaGLB/VrSkSwhxAVRmOiKGwu4
         6d62u8fSThYrkz4m9/gm/fEOsrmRf94sX98+mZEi+YxMLyrAuO8oAHJ2NImAP8Qc5bsN
         ZOqUKRvcEcOmyRmBDnruj3cJvdpDU3hV0fZOFu235If9qnPtvo7xDLx08Py8EdAJpPlC
         dY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y6wIAcEKWE9nqg7/k3qdRoBKRXzso0r5nn1/whrKqBA=;
        fh=A9pcX42JabSUPichejuIaLG7TMu08k/sSeR89UX/Rd4=;
        b=FVKKfVT0X8OGXINJM2ftMP9zwb2G0ELR8C+XSW9HjU9zmjFWJuEjM9Y5xLQ2fYcUkD
         XfeYW7Cq0X0mxTPMJ4NigBj7WaOposO53t9Lm6ivlt4uUNWW/TykWNRdFDFYSUAfA3yH
         9/31Qih4YokTSHfOQNMg6PU7jRPSx30iC4C+3W+FySAnorZ/etPVUMvhHpTZq44L16I4
         h8QmF4EkBPb7ryDlPz4wTpqaOUx6FY6QgD2ucYoCtiPbu584mgzxdx6jVjcR7RfPMS54
         nwoaI2ZQmiUwa4pjbKnJXy8YPi68aJsxvybk7Ts9r1hZjGKUEQiM/eYURtuOT6o3xaeP
         BQCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789542993; x=1790147793; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6wIAcEKWE9nqg7/k3qdRoBKRXzso0r5nn1/whrKqBA=;
        b=Qo4oSmxc6YfNMGNSzkp87X9Pp5/onseq0VabZH6IKo+GnodhyzDWISCEFOr8RvPh9Q
         wJ7h8VLAE6t77MBV9UYc44DPau6rbLp+YEUsDUenHKJjZb1SahXCRZNQA6X7DYJPRI9O
         3UyUS2JIzqA6NlXPNzPrd1joqSGrczxmA9vH8JQ9gNGY4cC6drf/0Jft25ykGpsgMHUX
         qqy4R2lyWJLbi/bGuP27ZvX6QDeScTzIi2w3xbPZ022Jljfu5kfhROfBnD6pZ9I41ic5
         z0vxkg7lqOpeyYPdeM9gTkPNnWPCGgyf8f6sd0wOhnfHCdFVUrn2PAngJnIm0POXjcV1
         X+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789542993; x=1790147793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6wIAcEKWE9nqg7/k3qdRoBKRXzso0r5nn1/whrKqBA=;
        b=uXhM04VkCs61UGqis2Fjmvr5SOECl559oSY8bh5gB5RwHRJ6TfqMo5B3IzEe/xGiNa
         OTxgbhVD/C70WGNPcYAo5qMNhW4JDpLgcSfxndu5I2FUqCN/+1gpEygifQYLtdynRRf0
         URHsGd1NiMiqNS8tcysl0tvkiGJrRvAHZ4to73oS1urbCcElHYKVWODzOS5blkG5Wm5V
         zNmqBMx/o2PfQwropFR+qwjNCQO3L6yxCh1xtfG95yZexsfDAWHIXdzMfc8+u2N0ox1Y
         EVr78b5nL3RHPC0juT2yj3d90BRSGWJFVpqDFJgWDGrZIkhwIKAm/1r+ga8E2TmrpYFU
         WzdA==
X-Forwarded-Encrypted: i=1; AKwUvBzm/Miy9Z+jW6yyMZRl2/kSuw9XqGOVx/54F8DRSH2N4/trTuxkYwCjje+IMwpCDW1/7JBYURiqwiuHQMZaxqQ/@lists.infradead.org
X-Gm-Message-State: AFuF++k1+7m4cuqHSnDD/zJS1hqHmknNfR0w+d3DOu1xVC5b2K1tmXHB
	nPZs7o077zjvXvNMWDdX37Jr4tLYlwdoiiwkpOOruqvV8sMsCY5WYkGko4oPlCylP/PecZJI3U8
	nThKrLHmkfR/1rqD+9dBZhd1IBq7RN34=
X-Gm-Gg: AYBFou34s8AtIJ+VmmHI82V8oJ/koZHpUO69Hhv6kHH94XQKliz9RkmR3uU2o3m1xrT
	80L+ygn7eov/+Ni6xAz4IFmox8GHqSoywoVBAJ1VXHbbZKePnmr+gNiXE+n+rcg9YFKEtI6oASR
	xurs8ipf7ZwZv1G0eSu3k94FeE5Elg1e1vGEZ4XT1EZDK3NzCev/MbTXyCGDgvxc/++0cktdYuD
	EuJf9vtS2dPnwsGM8rP97ZHfiDIfzgSdEer1YNwsLjTKCvAr1dbi5giX9NeZnPY4d8urxDSbeiW
	IItFe1iRRFSsnHuaHve/3G9GDNsYrwbArfF7Mx0KWdqzUpBDrgMkfQxWLpO/NskhetIbyKD1J2K
	ve2328h6Mw/OzHHallZEZqbQ=
X-Received: by 2002:a05:6a21:6b10:b0:3da:1e7b:ea27 with SMTP id
 adf61e73a8af0-3dd5f6fcf23mr4128744637.21.1789542992705; Wed, 16 Sep 2026
 00:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
 <20260915-drm-bridge-drm_panel-cleanup-v4-8-30401d9406f3@bootlin.com>
In-Reply-To: <20260915-drm-bridge-drm_panel-cleanup-v4-8-30401d9406f3@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 16 Sep 2026 10:16:21 +0300
X-Gm-Features: AcwNN1Wu02WhbDbGzw2qQ55m0JlviTMXZEyfe2ujg7uZXtgVBYhdlrVFke0bQq4
Message-ID: <CAPVz0n3kwZJTpanbCFzYKj=ysXQ_V=+uXjD5hY_n6OcDvnrx1A@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] drm/bridge: ssd2825: select DRM_PANEL_BRIDGE
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_001634_107014_A85A36B0 
X-CRM114-Status: GOOD (  15.12  )
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

=D0=B2=D1=82, 15 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:47 Luca=
 Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> This driver uses drm_panel_bridge_add_typed() and
> drm_panel_bridge_remove(), which are enabled by DRM_PANEL_BRIDGE.
>
> Leave the 'select DRM_PANEL' because it is needed for drm_panel_put() and
> drm_panel_enable() which the driver uses.
>
> Cc: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 73e13ad59a93..92938df3b747 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -351,6 +351,7 @@ config DRM_SOLOMON_SSD2825
>         select DRM_MIPI_DSI
>         select DRM_KMS_HELPER
>         select DRM_PANEL
> +       select DRM_PANEL_BRIDGE
>         help
>           Say Y here if you want support for the Solomon SSD2825 RGB/DSI
>           SPI bridge driver.
>
> --
> 2.55.0
>

LGTM

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>

