Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D503C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 20:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiWkzSXLrg0x2FGE/eIO2X7UZ5sYnOvtaeA8i0STfAs=; b=kuVYrpUWPVbZL1bJPmzMHivf22
	OCJAOm6Da3O98+86wAbg1Gt4GsgIY+TAO/AEh9NeUwumsBJKsUF3x5Z/hK9fchXLsTGMiQ/9zyrve
	3ZLldc7BfAY9eqJi/JDQZtxg6oLX3QxRPDr5cuXIB34v0VzkK36TTODAPUMxWHna46EWTPgm3Dld1
	Sn/IbvEshISVk+R+oI5gWaVTgVwBVXz0SBsdxX7rQ731NE+WS/XQZcO3+Uw/WurXivCP1E3XH2VFs
	JwWQu5Uh4wubq1SbUh6y0kXAJDQtQ700AXxICZbG/P/zU/8EPcuNWDKrKSYBXYQeA6YwiLcDX8k/7
	qHL8rPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weISN-0000000FQiC-3uha;
	Mon, 29 Jun 2026 20:19:51 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weIS8-0000000FQcH-1cr2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 20:19:38 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84780c95e2eso954370b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 13:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782764375; x=1783369175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiWkzSXLrg0x2FGE/eIO2X7UZ5sYnOvtaeA8i0STfAs=;
        b=anVcecfIbABPqGAyH6lZpUu9jsbt2kEOQ3qFEdvJ/3Ph+4rw7C4kDQzu9VJjbZ2tEK
         CRryeDmpHW5DwSIvLbx8r97kOzeD13/BWEY36kaeM1tDKoOTv6yYbLpKQV8DXmBanRgC
         NP+ErAb6hbsBfJpe5BboCuboW/TmGD7pjs3jQ51nQRsAyqPA1gr7iM32hQdEvg6KKKfg
         ehvQCFanMPgWrso4vfR8w/mLEPSEYqkibHZRZlKawQR4BqJKTMW3FwCu6mFekh/R5Ljl
         fD/HLl//mKmKmfi4PQTxZI+GZa4h6pGYNaGwNVLUCbL1pHyIbKmmrT/i9e67ZyUy0YxK
         7fXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782764375; x=1783369175;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tiWkzSXLrg0x2FGE/eIO2X7UZ5sYnOvtaeA8i0STfAs=;
        b=HV+xpcwYAEpXQVqH4XKJxvBwenfxNO6MYtXMxX8rMjPIDBHZT9JOW49mbyYbI4vyho
         5xLKowCxnELA7UAmeZ9479dEGUHVi44thGhsdSwt5GUzb03GjuegDa0L9dGwkNmLxFHg
         ZhzY8v9I45Ek1M27diOLCDl0X6IphdR76XfU1pGuEXMb7WZWbOgg9vSpbtbFt6725+eP
         FTPWb3ZtiRf9Wu3HMQ01SaIVmIDDW5pimhnNTvu1RN9YqiNn7h70DZj97s4JvF3J8nLa
         j8Ynra/Egt54AbxOifcICMbxbEYPd+LuoqJTKLZqoA1i2EHGLSlwwBaiPdzYwcWty4yR
         8qEg==
X-Forwarded-Encrypted: i=1; AHgh+Rpscfyy4Yc65XGetymSwVBxrSkEhxc37EsqVq9uphlGRpcsK6TkQbV4GNUwwSfuvCBbeR8kM4ZBLphDRggZHqVY@lists.infradead.org
X-Gm-Message-State: AOJu0YyaEiVgI6eJ+Nb5rXVh9DLcH0Lgg4qIVSz+jZVhpjb1UROOeldN
	bEMj3Gu9lcmZvemC0XItiyMsGC4b1CzevQim7VVNHzhmbo7INBjU4vA4NAzzQJ3cr6k=
X-Gm-Gg: AfdE7cnZvkgneMthij4WrEQeMpco0UELlRXQvIsxzfIhiLaVdsRsAWf50rU3YZ0yCZ4
	76sYCVxuar294EkdbPeHRjt42fdbvYzG6cfKxOj2exqZu9qx3iGlt4XL9QfzAOGCQz8DD2+Z6+Y
	vDAIvRo27MBlbqnVlIm8gIKJIO4gvti2clsB2xoCbUEMUpospZIfQJBWloB4PvF3C86r+mB8fXt
	yhD2IdP12wuTL3y/6hkImrEH+2XLkoV2TPnlev1ECpc0i2elzn+oCBonu/oWVs3z1pHoQ5CmuDF
	lG8kayIdkCmKgOkjkPbo/9Lk3tHV6nug9DREZKzc+jxzTpo7DG6K1yniJulFm9TsflM9u+NnMMi
	6lb1cisugVxW7QShpqW9M94qHGOiUZiVqo3bEiJAwmDLgy0BJaYm8N2SpktR09FgKHnpVTayyiR
	sum2ENHErEUA==
X-Received: by 2002:a05:6a00:1814:b0:847:98cc:a347 with SMTP id d2e1a72fcca58-8479f2ce28bmr712007b3a.61.1782764375358;
        Mon, 29 Jun 2026 13:19:35 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-847a0007464sm316121b3a.23.2026.06.29.13.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:19:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: paul@pwsan.com, aaro.koskinen@iki.fi, andreas@kemnade.info, 
 rogerq@kernel.org, tony@atomide.com, linux@armlinux.org.uk, 
 Haoxiang Li <haoxiang_li2024@163.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260623072534.1997680-1-haoxiang_li2024@163.com>
References: <20260623072534.1997680-1-haoxiang_li2024@163.com>
Subject: Re: [PATCH] ARM: OMAP2+: Fix a reference leak bug in
 omap_hwmod_fix_mpu_rt_idx()
Message-Id: <178276437440.1055800.18333324347324908320.b4-ty@b4>
Date: Mon, 29 Jun 2026 13:19:34 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_131936_428324_37DC0F28 
X-CRM114-Status: UNSURE (   9.35  )
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


On Tue, 23 Jun 2026 15:25:34 +0800, Haoxiang Li wrote:
> omap_hwmod_fix_mpu_rt_idx() gets the first child node with
> of_get_next_child(), which returns a node with its reference count
> incremented. The function uses the child node to translate the MPU
> runtime register resource, but never drops the reference afterwards.
> 
> Add the missing of_node_put() after of_address_to_resource().
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP2+: Fix a reference leak bug in omap_hwmod_fix_mpu_rt_idx()
      (no commit info)

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


