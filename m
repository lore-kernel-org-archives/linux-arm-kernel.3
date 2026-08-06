Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B45BC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Z89kXcdp+v6CMSCH4P4EBLtkPOyVSNFrnKEqAKEPmw=; b=W2XOCHLsgRNmvhL0fma/31rMMs
	nLG3thDr0vCcTkU5egzt6z7F+iSwobQAzaXeWXIM5ewZLKow7mBekWW1WXXg81SYZgr51IubcnZrk
	NE3e3se5TGVxnQwwt49tBmqMHUY8WbIK7bsNnzkFLpBHB3Xo3jXYXZVD8j9tkYQm5xw8TViQEmyXT
	I14QcAtLCHtb1hGAnm6vhzpozRMd/9zfdP23T5a7AEBnZ4uhXpPKiVMhqXZqR/BnK888zbj9NLfg7
	upSpFYD7qtBs3vSDIyRabznC/kFwlTapykorKcpxlncS33xP80wTR5BVLlTNk7DNwHQrXFxVFFyMb
	+3GhQutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrVY-0000000523R-1ih6;
	Thu, 06 Aug 2026 06:23:12 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrVV-0000000522m-3IEa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 06:23:11 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso446855a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 23:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785997388; x=1786602188; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Z89kXcdp+v6CMSCH4P4EBLtkPOyVSNFrnKEqAKEPmw=;
        b=fAJd7KsqmugAncrNKGU5Qy1EPtpPd7+9GhS+hTJg9QB/EM6anCfKgr8uNIds7WNb9N
         d3l7rAVrDOYfaunRNf/umIrhAf08gMBWUOcEfSXK2tkjbpMtad2iQvi0zLw5RSMaBizK
         J2enPgwwhw2FRDx7B8TzY1jRmfxqa6qA9oacI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785997388; x=1786602188;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Z89kXcdp+v6CMSCH4P4EBLtkPOyVSNFrnKEqAKEPmw=;
        b=VALP8roYASiGeQUQ1UiFXddn4SyA/3NgRzEnQgVq3cFtPhlXKnV7LfehbfXxH3mx9W
         Y/q4Ob5nQ3b/H39ZjhSmAO0IZnfyMy99Xgct0VnUZ7O4kVrZ8sp+dPWDh8iEfLRSwXDf
         Ic50O9imZAs03lD1f9CJ2kI3ntIz1Bw32DRzve/6hScBQdTiXjr4mSBHhVDf1xy3Agbw
         HZK+8pOe9KXJ+rXQ7qb5fs1Od1rACthVpVrPgrbIFtvIW5Lz970oDo8YIlb9mlt8VbIW
         52zF64IdZm+PGkupwi9uL03TlPBNM9Zq9bEXWh0p8st9Dap2EjVRhCP3WMVKmE+VUI0I
         d86A==
X-Forwarded-Encrypted: i=1; AHgh+Ropb8FiWif64LJ/6TS5aWeFFjh+QcX7HAZOWkQhO+HG80zi+vPRRe9yYJaRS9Fj8KWEKtu4p11qqS22Ek5RMsoo@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx6lbpsU1q0mwNviLgi4/FaOM66lZ2uJUPCGtTi64b2d1ZeIGF
	8ktVsjwf/dxA45S4nSfHnFVGjTk/XjHMvblehJW7y4pwv7HOODVlWmuNTnj3g+YzGw==
X-Gm-Gg: AR+sD12oliE2lA6AqvxkjP2Cmmz3zo5eGchaGv34YkwaG3sgQMHO3/VIozklhpjDHzf
	VxBPIXeOIAG5ea4mrD+PF3jNqNuXlpToqQMqp5sNrshxqiwCSIP7S4pF1m59ghH93kkqsLM28yd
	LuQZ0KC78fgbYlZIcArHqxvEyrWtNg7Ru9IuziZqGKZaqZEgfjEm3KzSFFVqIvupMw3TCMoQ1R4
	+C0K0yNKEDgOPltgNXPs0y9jatnJ62tRfas1BRRbba4eLmu/18T6cI/8C4PVv1v+GJVvD8sr/tQ
	KWv9+aptVN0yne9nrdOortka9YJ44Fpf7JhEvyDougxfoDwfCSzxKiusZvTqkvNuWFe9ONuC5wZ
	TWjw2qoNh5Xq8WZRYsLnbv2YOiAd+5c2GSXGZHP1RVAYgZlgt6JrDdeMPz0pPQ1Vqp5oevh+fmF
	Mn7lGfBtr1lmtljJ0Vyhpco8jWuHzSqhv8ubu93eolK68t7R3XYYIp8IFIdaEPaIoYFZ3LfgyLo
	I/E0fyVZkbCmCvJ6W2i8EBluCAcRTB2T/eMGUWVwu+C3yGkx2inT2OT
X-Received: by 2002:a05:6a20:9144:b0:3bf:78a1:c140 with SMTP id adf61e73a8af0-3cba2a3f7d1mr1941065637.7.1785997388510;
        Wed, 05 Aug 2026 23:23:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:fdd0:1bd2:431f:2014])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe707eaf1bsm2529941a12.11.2026.08.05.23.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:23:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260803111319.2836240-1-wenst@chromium.org>
References: <20260803111319.2836240-1-wenst@chromium.org>
Subject: Re: [PATCH] drm/sun4i: framebuffer: Set mode_config.normalize_zpos
Message-Id: <178599738411.149139.6199626642838531611.b4-ty@chromium.org>
Date: Thu, 06 Aug 2026 14:23:04 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_232309_964775_10D80A4C 
X-CRM114-Status: UNSURE (   8.39  )
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

On Mon, 03 Aug 2026 19:13:18 +0800, Chen-Yu Tsai wrote:
> Back when support for zpos was added in commit 47a05f4a68f9 ("drm/sun4i:
> backend: Add support for zpos"), a custom atomic_check callback was also
> added in commit b8f1230dd3bf ("drm/sun4i: framebuffer: Add a custom
> atomic_check") to have a place to call drm_atomic_normalize_zpos().
> 
> Commit 49efffc7fbd4 ("drm: Add drm_mode_config->normalize_zpos boolean")
> added drm_atomic_normalize_zpos() to the standard atomic_check function.
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: framebuffer: Set mode_config.normalize_zpos
      commit: 2d5e8c2167ab7af17535cd7a6f5bda995e85c7b2

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>


