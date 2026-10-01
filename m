Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105AACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 06:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgzBsM1JA4iQunu+Kx2XkRq0fCFr3hYwq5VUH7QKHsM=; b=1ZpFri3osYrED42cz8mCqnwiNx
	vgYipPlOlC1tlF/qgno05/rEoNpxh4BpHEOrbn9qOpTS+UR6ezdFDKA96COeUHstcLn4GUqkrR6fN
	RtWRqFP40ef/zb5hegPjUKml5K4cpAKIyuEOCVfI8gqKq6HEuU/c7haNevf3ZAGU0/+ed7dW2P7u/
	FmykaZOHJNxGGlTH/Z4S+vZu6YU/xEIynFJETM9gdpoGX7QHuN40UbuolXwRBgZy9ymYpNiQDxgj0
	Zv97OcbEtW2GzwzEYCtyY34e7ea9tDUHgzP4JcpiXBXcNVUoaGlaUVJ4VswgZgiSCWSetOIj4MiMr
	CK51V9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCA1h-00000007rz4-1xU0;
	Thu, 01 Oct 2026 06:12:17 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCA1e-00000007ryj-2AXh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 06:12:15 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2d02df2bf09so43381005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 23:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790835133; x=1791439933; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgzBsM1JA4iQunu+Kx2XkRq0fCFr3hYwq5VUH7QKHsM=;
        b=QHSvhJSHDahXFy8YFgQhztKRe1xUeRijyxH4eGOvaZZCFs61z4aa+2hWiCpsbZ2ZX2
         9dMsThbVBFSzgNdUo6mCS9iilf52FckZL7QTjnzLxjAkg4tHef8qrPQr4djZsq7ErFZe
         69Jp5bKUeHsRAEN9u43Aa0hbRjaKqmlFCWLTpJcY084z4DX03lWHPRqQK1qZ9EFv1fCn
         d2Ulmt+IFXIu1UDHUBQjtl/ZI+CyF11FzfjZ3asn5WKidH9OngEflfV5u4xODGLtVSaT
         WDzKNBbAiuO0YH3oxCA53iRHcw0C0MgKHCl+5C20EbCJffG8K0ZFmFgM9WzyInlhqNqT
         9NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790835133; x=1791439933;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OgzBsM1JA4iQunu+Kx2XkRq0fCFr3hYwq5VUH7QKHsM=;
        b=o3zntJj/2OZTVQqbyMuefI74BdGm1VA/Qz3onbX8JbpH+iCbZHOxeUuh3I549NIjC1
         yn6CjD6FaakCRTtlc1xLCqp8pOw+qDtV8M5DEbFl40NuWTbcmTeOBiJPnJCE98IJw/Ls
         AiL+oeSpTLdGYnlnqTCSZzwt6y9w2V0LKfsaMZTk7OXelb2C7+moyJkb66xBy8QXsnkm
         PMoQGh3POmyrpnoUgNI+hRsko4gOdmoeZq2s5DTMbogGbRBsIByLqcjHSx9zk18swNU5
         ekEovmXJS8CND7KKrzA6kDGS4zeWhMg8bg/qYBPAlJpSrcTqkRPiSlfFMHM0w2jKlPzZ
         hKpw==
X-Forwarded-Encrypted: i=1; AKwUvByZPycoWzyWkyORnb1zy0wFZI4dnJjSqEkHh1hl3YWlw8eG/A2+S3iLGOsDFEZyFz63+ZCpB7rmfjvvFTY6wXZf@lists.infradead.org
X-Gm-Message-State: AFq9FYJAmxGpAM0GfPQnbQvZw26yYhx3cHprVfvl5WlRvyqeKBsP/Im7
	WkV0pNDt9/gVchdqJxwu0LPDSPXLCjWcAnJwrYG5kO6Zt5zsyRV4CUrixxaVQvW2Cbh4+YGEk76
	S8QG/SE5sxzsXZEGg3PEdsQ==
X-Received: from pgbfq9.prod.google.com ([2002:a05:6a02:2989:b0:cc7:a60d:9a9b])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2c10:b0:2df:ab36:f145 with SMTP id d9443c01a7336-2e2e4bd212cmr32095185ad.68.1790835132740;
 Wed, 30 Sep 2026 23:12:12 -0700 (PDT)
Date: Thu,  1 Oct 2026 14:12:10 +0800
In-Reply-To: <20260929100946.693962-5-larisa.grigore@oss.nxp.com>
Mime-Version: 1.0
References: <20260929100946.693962-1-larisa.grigore@oss.nxp.com> <20260929100946.693962-5-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001061211.4142384-1-stanleyjhu@google.com>
Subject: Re: [PATCH v7 04/12] ufs: host: Add common Hibern8 TX FSM polling helper
From: Stanley Jhu <stanleyjhu@google.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
	Ajay Neeli <ajay.neeli@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Pedro Sousa <pedrom.sousa@synopsys.com>, Hannes Reinicke <hare@suse.de>, 
	Joao Pinto <Joao.Pinto@synopsys.com>
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, clizzi@redhat.com, aruizrui@redhat.com, 
	eballetb@redhat.com, echanude@redhat.com, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_231214_585240_5C3D348A 
X-CRM114-Status: UNSURE (   8.81  )
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

On Tue, Sep 29, 2026 at 12:09:38PM +0200, Larisa Grigore wrote:
> Factor out the common logic used to poll TX_FSM_STATE until the TX lanes
> enter Hibern8 into ufshcd_check_hibern8().
[...]
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Stanley Jhu <stanleyjhu@google.com>

