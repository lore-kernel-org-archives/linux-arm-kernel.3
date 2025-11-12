Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA504CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 14:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NXXQBYMTzm3gLErILMueN+E6s1/7eXeyEb6HsfSTTZ4=; b=Eo9CDgFUmow55TnO4B8j39Q8r+
	8uAFIqx0jaqThJqUR8a87uTX65vEcgNHfOLUJn2LwQpSVfnG5oWbVKcLSsMLy3kxoB8nggJGcnWDL
	6U0d7dmEe96pg4lfTbvw5cXBVk5+1qqGdoOoDs9nE2ReDMdWKkvECMhdGj0nlMr5OJoNtEkoReI74
	HcD2wb1CQQGcymAiFuBxwAI66TbXMxQPnPdlf3YsrQOR5zAZt+jh5KUrTVTztvBzm0u15A5PhvJ9r
	iI2M15omgvboQ0y3IVveUhcmV1R9FdD4GhfdXAm/kwsidkVXlIedGTzxkfEtigu2JXuh4WBY+WhsP
	UENOuJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBTp-00000008u6h-3XU3;
	Wed, 12 Nov 2025 14:05:49 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBTn-00000008u5p-01ry
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 14:05:48 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-656b612e607so325311eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 06:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762956345; x=1763561145;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NXXQBYMTzm3gLErILMueN+E6s1/7eXeyEb6HsfSTTZ4=;
        b=tZHsYXYqOaFszVPFjgqrvmmi7prI8P1gy7+fyFfjN4i74YHo1IQk6fG1PDJKezVVlT
         r/6AeTZGUwq7cojJaouuMcLLOODN9MyoMsh7mPm7OOQ7jg1GSr/EgnPK/Tsgdj2OXoTh
         8jCfbaqoy1NT0luEV26Y1zZOaPQyIpfoUuwTw++oxJkt83YCmbkBOuZGjTCWjzphYawz
         ohCMCUiTRYe1QHzSm/2dQq6gLRTBtGfQaUdk38Bkm/8wl3kPg6d3Cz0eiMbc5uJU9hjm
         IEF3JJI1+sKibl4DUc+nWCSJFjvc2aEV+GAy7xyze8eY2pXs447B9834V9eimiKcG061
         8jHg==
X-Forwarded-Encrypted: i=1; AJvYcCW5RaCkADE10FbmqulsyF2CvPDprRwOZM51xOYoF2Q0N90wi8JcEM7/Z7fVbF8C1KbryU3loOyunheCkvyNGQMO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1dX94EXOSJ4ismMWtr/k/bU3bkmSmRkLfhH/rw/+pDq2h7LGv
	G3YYcJhI4EZD1fYaKYeylcAV5TW1IpgkEjilrHtysRdFW9/uXsvKSHjU
X-Gm-Gg: ASbGncuj2Mi0fStXOEg0sSFaOQz/KFtKEHKKraIWXWynmADpP0q7EshvpqRpyx2fnG5
	403W2lv16Gm5fYFEn9S/2RPbYVPCPcByvTELI062xzziyfGTVTTk0O/p7oAolGkW74BcEoIohC5
	v7i2TiH8k6HcmNuZsWvn0rMcCWOVsTKZa5Z90rU/rJ4zTijAlyniEWMUkpEyhaG6bI0IvHUwRTT
	dahUTNnZcWSLS7TUtU/RKPk4yiy405RFGV6da69EmSir3ihqAfFgc38ujKqVCkeU9g8WW+FRABX
	9NwgNbwoNabG4rnzuFF0lrELFZjFpc0DrjMHIoJKim5svMEC8udu+gGf1pzf/Mdw6V/Ood/tw4a
	6YryaTP4qj7x2oXq+7MWC/3diTrjvZJUmuitmmfbQzOilu+TnZB9XFGS54E3PxIJ71EGx8/sz7g
	3P8jE=
X-Google-Smtp-Source: AGHT+IH9uVCwmTm6OkyU88vI+odVy0Xu6AMckvPgZAxQBcY/7uShVAzXssPRx3eOQ5f7SoJW+dUiXA==
X-Received: by 2002:a05:6808:6f97:b0:450:7169:8108 with SMTP id 5614622812f47-450740fabc0mr1503640b6e.0.1762956345284;
        Wed, 12 Nov 2025 06:05:45 -0800 (PST)
Received: from gmail.com ([2a03:2880:10ff:4b::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45031835261sm5175949b6e.16.2025.11.12.06.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 06:05:44 -0800 (PST)
Date: Wed, 12 Nov 2025 06:05:43 -0800
From: Breno Leitao <leitao@debian.org>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: paulmck@kernel.org, mhiramat@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: arm64: pseudo NMI bootconfig question
Message-ID: <rs4igmsjrm6r2aio4nbe5jos3vcqk2u4bjhltjwtj2pn3cquip@kv3grgec7qrb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_060547_431463_D02B9737 
X-CRM114-Status: GOOD (  10.93  )
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

Hello,

In most major Linux distributions, it’s common to have a separate debug kernel
build. This variant is compiled with additional debug configuration options to
provide deeper observability and easier debugging, typically at the expense of
some performance.

This approach is also used in several companies, including mine. The debug
flavor is usually a drop-in replacement deployed when investigating
issues, allowing quicker identification before more detailed manual
debugging.

I’m currently debugging some hung tasks using the debug kernel flavor and
noticed that backtraces weren’t printed correctly because PSEUDO NMI isn’t
enabled.

AFAIK, to enable PSEUDO NMI on ARM, the following are required:

 cmdline: irqchip.gicv3_pseudo_nmi=1
 config: CONFIG_ARM64_PSEUDO_NMI=y

I wanted to have pseudo NMI enabled by default in the debug kernel
(without relying on kernel command-line parameters), but this isn’t
possible today. The reason is that `irqchip.gicv3_pseudo_nmi` is an early
parameter, which can’t be set through bootconfig, so, independent of my
.config, I need to hack cmdline arguments to have the debuggability
I need.

Question:

Would it make sense to provide an option to enable pseudo NMI in certain
kernel configuration without requiring an extra command-line parameter?

