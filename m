Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB4AD29FF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZV3yspuFeXD2fTCOA+EG8wDsgm3hE+MlvzRhyE8iDHU=; b=q5HyOmtJWHXd6xZ7worSRC5pWx
	1EmiX0S1w6BC4oRZES6CCI1oLad9pA/WMNJpzQl8oyh7Yi6CN9cJWobJp4CEHkb9BL0Ck/CvnkYlZ
	jr6rXimswk+LeKx/b4A4FGcF902NNVqYHL0rDuVhfsjtl4fFCl4+5GprW2kbmWsp/83Eq89oSiTbM
	nozRYxGXXkCj0iwbiTotKXo46mPjioUsO+ftbumLdtFUTJ6i9bRaKEQatZjKKj3WZ/yNceGYGVJoL
	6AKLwA4194VMTUyAe4XxnyXG4IEMTjY/96joHl374mEJA2MxwYpi5LvaZjdDT5RBIKaOyAk5lEJ5H
	+SnT0mEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzid-0000000976p-1Is7;
	Wed, 14 Jan 2026 12:11:25 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfziU-0000000971m-2wX0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 12:11:19 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so47556905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 04:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768392673; x=1768997473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV3yspuFeXD2fTCOA+EG8wDsgm3hE+MlvzRhyE8iDHU=;
        b=VTgeT1S/Zqk9D1ZQQeIUJ5r5UR36tol0jYkx5pMPs6XOlWNfDJv9Q7om+p1iBy1EKI
         rzNnfHW4oWCE7MFiguVEOrYM0ycYdwxmUXOnPzpOA9zGHNhhjZ3ihGpRpMy7bo16XaSO
         5RtiM/OJot+N0OxHHEZCcyGssi4YyMxJLrRG/6osxw02wVwQk0MKQm4fRoGPyMjfgcG3
         lZ/Udm0LOgXDzs/Wtea08L93Ds9ILQjpznFfxW3nGPNapxn+LZxSXtwuHIcwWY3wIRB2
         RsRaxWoZc+381TI2Rl+/BtV4n1okx81xaAau9qTNdBVTds73OaO5qzk51EZT3Rhnu3TG
         ciJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768392673; x=1768997473;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZV3yspuFeXD2fTCOA+EG8wDsgm3hE+MlvzRhyE8iDHU=;
        b=jJ1AW5mr/EWnwJ88AEa5LIevnfWCUBaDo0+q2b6D8cNHWkkjNSUV4yEwoTIF9KLsXB
         Hmexfr/166cxdX2jAzEkb8wz2mbH8JpJEWERoRMhcEbKWmN6ZWxlU0Pdvng3buTi9GZ2
         PTLwDtZG5ohxjBGb3wxAcOkuy3/AbKa7LFmLHyITCxLhjAnFfYkhnVm5hRgkqpLQI1oP
         Bbxhd2HPm7j9RKrVB/fYWFjW4fJEr06qt1Do2GprtgYLtiLUOqmagjb35Fs5YatYgFTS
         Kw21icCbBkjI5OcMLV52i1yoRJbGu9U9cT1v8Rzg/aYw7GaXUtajPOqecT71XuBurLhx
         KfLw==
X-Forwarded-Encrypted: i=1; AJvYcCVKF4Oihb/9RezLHwrnlvWiPnqNb9Z4ckk94ae5KhuaGyTfWifuGOT1V3qvmWr2q2aB5uBCUjM2VQ6jcaa3r5dJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyJD0H6M2/BAilqmdCIlre0DO+W33Q6G0jxIS0COutQMeod2sqZ
	lfSWwq0M+17AeNxZo+mrTbwEoqNRr18yWwFuPsACAHKytTWAXLzRbrUqLzLhkBzGMYE=
X-Gm-Gg: AY/fxX71oZzR0qNgu+j7iu+zDNgEjy19KIXpDhRhovkEjzRuJXVF7XAKAS650ZDqEKw
	Cquxfe01RpzIIBwSXfFfL65SAE59BDI6OradASlNvrflnKsaDr53Cbxcqq+9Bv8jpVmPGFxprtU
	RP2R90c7qHtUmPSvayDnT8LAnlZ6vRerzA49e77I55u1rYc4YJnWBYnvsGP4voFN0S4l9Qr2Feq
	WR1EKJytF7H145Ysxv9XLQf5wnqZaFrnnuQF2d3aqnp/HJH45QuK0looR2a6hJobl8gyZsksTqc
	0au7giAxwawdSI/Dx+nhy0u4kwyHmI1/9hYBcN5VWOIZXIYh8+7CiYqM2/dKOiXO50jLSWRjjL8
	spuWl3CqDDdG4dTQPe94sS8AODdoH8FTw/j8dAUx17svQKmOAB528UbZ3oSaFgz64tnoLFbunJx
	XWzUqIqBBMt4g2NxcLuKA8/nI9cAHPLKU2XDKnR8kKVQ==
X-Received: by 2002:a05:600c:4515:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-47ee339455dmr25970885e9.18.1768392672997;
        Wed, 14 Jan 2026 04:11:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe83bsm50158222f8f.38.2026.01.14.04.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 04:11:12 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260114-amlogic-parent-clock-cleanup-v1-1-31078b1e4a2c@baylibre.com>
References: <20260114-amlogic-parent-clock-cleanup-v1-1-31078b1e4a2c@baylibre.com>
Subject: Re: [PATCH] arm64: dts: amlogic: drop useless
 assigned-clock-parents
Message-Id: <176839267224.2837299.13824498685588807202.b4-ty@linaro.org>
Date: Wed, 14 Jan 2026 13:11:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_041116_492471_89A29518 
X-CRM114-Status: GOOD (  11.03  )
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

Hi,

On Wed, 14 Jan 2026 11:57:40 +0100, Jerome Brunet wrote:
> Amlogic sound card assigned-clock-parents only have <0> and are useless.
> Remove them.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/1] arm64: dts: amlogic: drop useless assigned-clock-parents
      https://git.kernel.org/amlogic/c/126058f8d80aa7176bb230ca03ec939a70435177

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


