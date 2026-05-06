Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D851BCD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 22:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KouoTL4PzOBYmkbjYLcs67bF3yuXBF5vYz+z+OF4FFE=; b=EgNo0u6R8c8DF1BgD3oD9loeAi
	Wu5k7qYdDcQKDrGoGOtO3AXhVtK5u+Lmh0EEfI1lrA0S1k4miVmV2QAgbnt1cz/sNMHgM0JuLJtpL
	kbCZlZQdmxi+DHCTtsJKRz0sqfiUq9rNlxZyPW6oaSk0NpJ+JHdk9EOxCl84ebo/gla078Dnv0mN5
	4ZyEq9+vDtoDx48mHpBTJM1tLH7GBkoJJfDteC8sPq7rRSRMgOpafIDCxWMeITUrP+jDZMzGWZGTd
	9ah8kJ1TVWCy1z9H5RALOGgfRUxQc52csQhMC7qVAa1K7k55BXC/WgzfTJqRypAbsV/m/dDCl4qZO
	9WqcRp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkvy-00000002DfV-3TFa;
	Wed, 06 May 2026 22:41:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkvx-00000002Dey-19SH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 22:41:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so2293935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 15:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778107295; x=1778712095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KouoTL4PzOBYmkbjYLcs67bF3yuXBF5vYz+z+OF4FFE=;
        b=mIDDkXtWTOE9V+kgOH/68rT7HJnJ9EUefF+epSnYyRvye88YtJurd1scjO0gKWqcYj
         NS7IDUJWYSbeVI2uEaNxUVP+D9UjFEN3i6Tv39A5BfNowpJzGOlULQ/a6uVyvsARBvVh
         spEyZsruyfOgsNcwkad4Kvj0PPo5qRP2h5frzHBCRLet06oELAgeTrihVmVwVYe0WbmG
         r1aupVm3fwyBFt5sR0PGZyZsB7o5VVYT4Z8u2WzbK0spLko6YBIOj49nRG5zmQ+ulrz6
         hseeQwiYZwQdTgzTbB7Me3x3sHxCOtX3p9KH+DdgMAC5mJ72d8BmCSkoXQPIb4zmzlJX
         0OtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778107295; x=1778712095;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KouoTL4PzOBYmkbjYLcs67bF3yuXBF5vYz+z+OF4FFE=;
        b=SDtmjZdRiHRpc6N+I+fBWC6MHJIVXVGXNGYXaalfft8MqqJ+n2QLTlCPqylCT9g2K2
         quPuEMgSrCTVNU5PtdX+JgwmDECsp4lE90S1upKeUwSIpZkimZgTjtxYek/2cf8eQXfH
         cOyHHizSeuBKd1pELJyDfq4zGIQAgpzDg7XlES8nTb814DtdQYhjPMT5ZMd1CbysxByV
         9Rbk2vu7H+Hh82YfRwFzu9twc17AkWzJYzlD6Ji84JB8fCjZWo77rOxwfB+4cUTMjY4W
         T00ObrXxo5aDQAxb+r0kpeY586tztWUEDG/RbaXjMmwzHNJwbjRLdU2x4spQWUf1+HXr
         XRMQ==
X-Gm-Message-State: AOJu0Yy1N7wPt7n744/9aTz2TL8YXO189UNw/vZ+WjE1MDp6e5vhsa1X
	qaS2hyUvHAOJ9Vf/yhGV0q5eJyRKpqrr0p5rqvo7950ypGf8xoe95975
X-Gm-Gg: AeBDievWX6QKYGqABhgEqrZ5hzqXD04WCvHufW4qHAguCje6QwIZ3zGoa35hkIS0w9V
	wmc7gRS1yFUdbrRjgDirRxm3NDpsG4kwBrt6AE4I53cDKOiyn6iNJhAEEVjYQsqRdLursh0zBg4
	nKMIrpzYL4cZ75puAoIw41WqvZ2BHh1DPFE2WwKq2pmgdTWcnvxOlLOsRTd6Zt/7z/rhFRA/jSW
	zowyoHMqqrTgbY4VPQBLp3h9lnYtUkU76f/A2zGXj9S0FRIs8QKasRrwES+BG+HyT5NTOKlWdN0
	3KcQ4mHKYJ6kSrCdRWndXOg5wabgx9Toun3HwyOKTzvm9S0sfkSbYJE7bZpInLLWd+A3IDv9xy2
	lihfXKpjajR+7PLx4O9VGVn3hC5/+/DnNKLdMvpImjCmHfMFCtAmtkTsCPT2smKbBYOYgopZv74
	04MoyIJ40irgTFGiEiW0B6nG3hNdxTC+nIr0rCPXJGkwIMcqw7ypJUc/NSQjbmI+DIIAJQkFAg7
	9i3vvJgaJv9YERqFcwevkR8LPBbCiFqZafV
X-Received: by 2002:a05:600c:811a:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-48e51f369c3mr91695785e9.15.1778107294675;
        Wed, 06 May 2026 15:41:34 -0700 (PDT)
Received: from [127.0.1.1] (93-143-241-172.adsl.net.t-com.hr. [93.143.241.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538bc9bdsm92181315e9.11.2026.05.06.15.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 15:41:32 -0700 (PDT)
From: "=?utf-8?q?Duje_Mihanovi=C4=87?=" <dujemihanovic32@gmail.com>
X-Google-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
References: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
Subject: Re: [PATCH 0/4] samsung,coreprimevelte dt fixes
Message-Id: <177810729157.349411.9116754282787318766.b4-ty@b4>
Date: Thu, 07 May 2026 00:41:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_154137_317497_994F0D67 
X-CRM114-Status: UNSURE (   6.07  )
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


On Thu, 09 Apr 2026 23:17:23 +0200, Duje Mihanović wrote:
> A small assortment of DT fixes for samsung,coreprimevelte.

Applied, thanks!

[1/4] arm64: dts: marvell: samsung-coreprimevelte: Increase touchscreen voltage
      commit: 4da515eca1b8de56c9e8a17866626f99d9bccbc7
[2/4] arm64: dts: marvell: samsung,coreprimevelte: Use memory-region for framebuffer
      commit: cfb4346423eb5dab498546d617a8c444b878bff3
[3/4] arm64: dts: marvell: pxa1908: Add PSCI function IDs
      commit: e93abeef9267a9c3e063e594571d46b3d9461efc
[4/4] arm64: dts: marvell: samsung-coreprimevelte: Add missing SDIO properties
      commit: 52c47f734f934fdd83659e1a7b096597cca14522

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


