Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F8CD6B6B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f3ZT+G22WW6GHAmyRtnqdTwfgxmlP9Lmjrjq2GeXgKA=; b=y1OcmgtKpxX0mN
	+n+T88OjvjycjPCOlfKJSkb4+oQepiTglz4JTwMJYWqEhcE2KeScMa/1LVqTNh6onsiVh3CIyGf9N
	RzfGnZxK/QQ0ylky8jL0hYN2GgINy+qjfjB204SFu22BLjl2h+dtkM2fIB2p+gnsKTIstFF0OAbw4
	nExK3z/7bEE8XsPd4EmK2GCJ1hrFuKwSfBZVgPBjtWs0LDA6RSEV7Rd1EAhLSuSMsJm+5onlOyLuD
	V+F+AmJ7OF/6kvCBWfQp01x4/JTUed30ViBhizucfm2gjNQbHYCm17H8ATQMXDJFfz21hDUq33GXC
	glMG4YK6oKpnkoRsrOaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CFR-00000001DUf-0GPF;
	Wed, 30 Oct 2024 17:12:45 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CDj-00000001D0v-0uK8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 17:11:00 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539f72c913aso96844e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 10:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730308257; x=1730913057; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f3ZT+G22WW6GHAmyRtnqdTwfgxmlP9Lmjrjq2GeXgKA=;
        b=Ak2px2iYw3V+PIOvwW/LKw1LOU64mhOykPT+4UcKHvpHO8rtlsvdAHv/lbk5gsNyuv
         hFsVCl5hqbKoN3ABMxKgNdO7k5ZhTVPkjL3+QbBqDl1uGqRqqPVLEzfWGyMbEMwcy73k
         UFAe9Y2GLt2F9VtP4YFvx4DdBvhuqzgb9BeInCnIc6yXQ0aRaE96jAEf4yZ7hETiaR8K
         i74cMEnMFFUmPKnrECMZtLmbENggdQvr5rwmmmpOGQa1CME0ncDhQ4IJMrEnPOP5Ar6C
         46nTt1YihA0iyWWGji9heuRUbXrbXpiyYcVrJVTizVbjb1r9R5AsUfPlbgdD50UW3meg
         Brnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308257; x=1730913057;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3ZT+G22WW6GHAmyRtnqdTwfgxmlP9Lmjrjq2GeXgKA=;
        b=sliNRNVBtMc4XyAt2ywu414qy0NWX0UXy91G3PCODruwRNwFRoSNk05WEBt0k6WUN/
         22YdxjKvusxMAF2FWdg1NaAe+yqe3EPX2L2MB+/KXZrm0aT4s8zbVa+Vxd6abN5xU8if
         iz8vjB4cQH9bPMoaB/HzFwdKwqF+/ek1kovQpo/7qd99adp+isg687BkCIn0qj3YzSKa
         V0XaEfwQxlJHH44J1up9r91RioJWAZILJ9DJjc29jVoFLxgS/KPY15WObldXdedGnocA
         7ZiCEqv2ArV80QohQ/pUEZgSDuiH2BP5Au5sHMWltEdQV6zgPVcVGngfomjEQ9MT2Vxd
         t8/g==
X-Gm-Message-State: AOJu0YzqqL54EEGJ1xuvo4LgXUCh5Wy9etKQjw4jQ22YK+HTdznvpG5n
	g1SXMfPRzCHXQRn/d63qBoItKTeEkQMD/VL3cADDuV54Z8tV0Z8xoC0X0Q==
X-Google-Smtp-Source: AGHT+IEBwca9NENqe5RXTTBqItfYfpFgHgz7BTyrZlZkrUyXpQSrJXpFftutaPkNLTOWN6V3bzfNZQ==
X-Received: by 2002:a05:6512:318d:b0:539:f65b:401 with SMTP id 2adb3069b0e04-53b34c463d9mr7254555e87.57.1730308256453;
        Wed, 30 Oct 2024 10:10:56 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-fbf3-0656-23c1-5ba1.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:fbf3:656:23c1:5ba1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9a9faesm26828985e9.35.2024.10.30.10.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 10:10:56 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] drivers: soc: atmel: fix device_node release in
 atmel_soc_device_init()
Date: Wed, 30 Oct 2024 18:10:43 +0100
Message-Id: <20241030-soc-atmel-soc-cleanup-v1-0-32b9e0773b14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJNoImcC/x2MQQqAIBAAvxJ7TlDrYH0lOpittWAqWhGEf0+6z
 RxmXsiYCDOMzQsJb8oUfBXRNmB27TdktFYHyWUveMdZDobp80D3k3Go/RWZssZ2XA7LIhXUNia
 09PzfaS7lA6q7IWxnAAAA
To: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730308255; l=1086;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=NYhBGuYUoPm3w1jTLdPF3eAlajcyC21JWzVKEKWhCoE=;
 b=Z6hc0wQhA88bBphN4kmf7W8aIwsZ2dRwGrDeGbzmKPnez9O5nTH6KUCVDrObo9G3JnxKNGcG7
 Tl376np6Fx4AJtAjD4G+h5bgDtU73hZthKWkhvL2Llp1Ck+diLpSXVt
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_101059_299956_1674FA3B 
X-CRM114-Status: GOOD (  12.36  )
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

This series releases the np device_node when it is no longer required by
adding the missing calls to of_node_put() to make the fix compatible
with all affected stable kernels. Then, the more robust approach via
cleanup attribute is used to simplify the handling and prevent issues if
the loop gets new execution paths.

These issues were found while analyzing the code, and the patches have
been successfully compiled, but not tested on real hardware as I don't
have access to it. Any volunteering for testing is always more than
welcome.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      drivers: soc: atmel: fix device_node release in atmel_soc_device_init()
      drivers: soc: atmel: use automatic cleanup for device_node in atmel_soc_device_init()

 drivers/soc/atmel/soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
base-commit: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
change-id: 20241030-soc-atmel-soc-cleanup-8fcf3029bb28

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


