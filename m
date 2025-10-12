Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EB2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWKcq5BvBCbW0uN/aWPEZSUYGg1aTkDuwmWaEW+ABv0=; b=fCaQJqkJ2vldfGt2f89XPvO3Ub
	c55mP6Lev0vIPj5auwOOvXqF1ps2knd4arTQ/HfgWA6+tViU5I8fdC7CJaPO4Ya1cqaGYPPJ9SA6O
	S6q9vLkm9gjru58ZHf6ECWDIoHXBlLAu6VveIUOoGMf5k2+FxrSHjDRxmDJzS3YPqLW3ktrMwfVpw
	fX/HtRNi2TcS9HwGv/ymmSmod+jleVkx9Q65ACMGnKoyfv9Ztf5NwYKuQ6V9qeotGF8XUCTpSqw/D
	q/EQH/R0iGUSZdYuUh7Ztrb8tYhhxzs4528J0R0Ug80ifvNd/Hwf2zMceztEqSlfN/UiaLRrNZrAq
	CCP3apsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7uG7-0000000BHEo-1peu;
	Sun, 12 Oct 2025 11:29:03 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7uG4-0000000BHE1-31UJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 11:29:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4257aafab98so2891811f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 04:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760268538; x=1760873338; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWKcq5BvBCbW0uN/aWPEZSUYGg1aTkDuwmWaEW+ABv0=;
        b=XDFg6wB6HZIrKwGxbNZsV+rjPe8mM/Z+EukO8aERI5jOmJjyuWw7AZz9OfbSi2R4KN
         4gjVT8pRL5U3JYVOe2AX5895GC38tYVn1Cs/Il3r9LjWEGIgZywmSe1bIgD+SRxWFQQm
         YmSz2efrnZlzbczr3Fuw2tZQTdI6mKbZvmyYiPAYxwVOVj74AOI5U0Ij/HA3Q30fe9FG
         UEZtmdjAa/YSBAwCjyumcNy/8Dlrh77OJHd8Ehj/0ep1Zf6/HWODpYMcyGpGXEW7SbnP
         wz9d8mUxxPJTC0VNyH4p12ZaqD9gcmKu97n8xHD8e7GczYMmF8oDxJCXpd/jycOhyKec
         EECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760268538; x=1760873338;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWKcq5BvBCbW0uN/aWPEZSUYGg1aTkDuwmWaEW+ABv0=;
        b=keUfhaXdkDdEBbLibyfYdPBJo+Wbz2DmTPqTZNGWVYpLfhW3N8CNdZ+wIP6w5jA0dY
         D5xjPEKzjRDbhMcAnPoX4RUYYdJDExwrKE+Q/jweYNxt0LdSiR9mHb5wmgE86PEhrojZ
         iNLCWqAuMqfgz99JQ1xGm02sGuxHU8ju+U9cuzT+PkfdCoujs21MO54qpcYkjrYeoB5P
         7YLMvuAtIF7ZqKJ+Fqnt+Ti8IJyH3JpZKdSQjeJQx3h3blwu9lO2tJu1N3TTLVp1Tfza
         oXLkNtXU1s3Jt7Al60qktw0I7gCS8PfI14bR4L1Z2GsIRR9oP6XADm1BmgzmcKqoOv+2
         /kuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVAcOP7L/8OEcyQK40ifON6kYP4Hn3TCmwYuFy3HHUFZiYq+u+Fa43ZnvR1FnYtiNYwA2E/Re98CoP6VbNgwoh@lists.infradead.org
X-Gm-Message-State: AOJu0YxTImH55WO9EXQQrI0Dyzd2zdrxFVlforuqXuEMXT1kM9sgzyDs
	cIFMKVf9eaMBKUPKnf0l77m+kBiBvUrAowc+WBSMBTlcbK9OC/rhPOae
X-Gm-Gg: ASbGncvIQ3b6GahaV+a2cDrL3Q+OS/3gEY8KXxt5/Be8F6EHePtFwAupX1kNCcREZz3
	8TFsK8fK3XM+fCUSAtDVBo1oPrF8RzUv4J5tsYFpBL6ggM3RFr0Bg4ztV1r1RDY0Cy1Gj8OPA+n
	anVUKA3ZMYc+pONo/DqQ878CJ8C/ASpdSAew3TQxVigIfNq1xbRyEHP3lGdHiqOnrYZGXvl7TAd
	aEWvuNSCLyrF4E2vkjXi7of6Dp3Q1SMDr8HBR0EdR1QlxDzxZ8gBW7iJZFuLbULVaU1SJ/ltW+V
	88EVp0qv8WA0gPh88CnAiL8bv5qPJ5gYvzFv/ncOfbk7BwdKaRTtditbHt8LQ9tBNIrmNZPgiOZ
	JCBKdOuox7zBlINLHUnsSSQjSenGcDgmn2UOd8/FINY/pKm9BOYLKQ6uqT9W9Tb5BFg==
X-Google-Smtp-Source: AGHT+IFIgmUyYZvJ+WTBCCmNwTjhLJVGwhLPHJ+WDG3InpnSBdGbHVHGfZIIZz0xV+9R6mVWBHO/bw==
X-Received: by 2002:a05:6000:2509:b0:426:da6d:ca6e with SMTP id ffacd0b85a97d-426da6dcaa6mr2164779f8f.58.1760268538276;
        Sun, 12 Oct 2025 04:28:58 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce589b3dsm13194458f8f.24.2025.10.12.04.28.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Oct 2025 04:28:57 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] drm/rockchip: vop2: use correct destination rectangle
 height check
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20251011130450.123444-1-alok.a.tiwari@oracle.com>
Date: Sun, 12 Oct 2025 15:28:39 +0400
Cc: michael.riesch@wolfvision.net,
 robh@kernel.org,
 s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org,
 simona@ffwll.ch,
 airlied@gmail.com,
 tzimmermann@suse.de,
 mripard@kernel.org,
 hjc@rock-chips.com,
 heiko@sntech.de,
 andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <79AC74F5-9579-4A1A-B051-FD8731DCC524@gmail.com>
References: <20251011130450.123444-1-alok.a.tiwari@oracle.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_042900_773131_8B84DC9E 
X-CRM114-Status: GOOD (  15.23  )
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

> On 11 Oct 2025, at 5:04=E2=80=AFpm, Alok Tiwari =
<alok.a.tiwari@oracle.com> wrote:
>=20
> The vop2_plane_atomic_check() function incorrectly checks
> drm_rect_width(dest) twice instead of verifying both width and height.
> Fix the second condition to use drm_rect_height(dest) so that invalid
> destination rectangles with height < 4 are correctly rejected.
>=20
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c =
b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index b50927a824b4..697f54777a32 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1031,7 +1031,7 @@ static int vop2_plane_atomic_check(struct =
drm_plane *plane,
> return format;
>=20
> if (drm_rect_width(src) >> 16 < 4 || drm_rect_height(src) >> 16 < 4 ||
> -    drm_rect_width(dest) < 4 || drm_rect_width(dest) < 4) {
> +    drm_rect_width(dest) < 4 || drm_rect_heigh(dest) < 4) {

Typo: s/drm_rect_heigh/drm_rect_height

Christian


