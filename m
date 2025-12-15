Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9538ED5B177
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yB3IbvEWC8bOFdg+c6VZLoSnFzG1Fr8fYx2wFSf7o5Y=; b=bHPWy9+42ofkumFzWSIp2pk6NU
	RvaRI0Uar9dxW6qSsuUM9Ck8s1kfmJdurIKwrqoXJ1jLmEYxpqP9fkBnkeSXeTTYfmqq874am284w
	7jHDG2Xu9SSbjLYsHRD1dTTs5A3hKnCwi9/DNSmombbNoPzs/7Vvn8g5W1t0wDUKjTE5EoP52+8RJ
	G0Pubeub5kT3qyy4aq6QNy9wCDJS8BKpTCQdWto+i8a15MUhZWNAdBmqIb4p0YVa/cN1vnLLxtASO
	l5PlbpVljsgc6y5TPDSDmdpbuAeDY0T9eul9kWZm90dsmZ1DALHebypriIaC9xc2hGd5RjdneUY50
	76rmy6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9aV-00000003njx-0HH1;
	Mon, 15 Dec 2025 14:30:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9aQ-00000003nfB-3gcu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0D7843D11;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A222C4CEFB;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809005;
	bh=AwEDboNk5GmPqrs+ygIr6oF3UxdqLcCX4eLfPid2KXw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eFnn5rK5ZJjeC1GTOsEbqEYZXSPAtLC0k+0D/HS9BqcX1hlOTZbnx7sI4XYrgQSuE
	 2Iehherh73rkKYUZt4iEMaQEJIdy3qtNBqZNfcUYov9EIFdIbl8roLERrJx9e1ao6d
	 nu9Ktfu6077v8ejNFSHspvsctRrDO/lE/RXCNJMqf0aeU0GA27PjCrLasW63uAm7n7
	 tKxL+4zMxEtSeY7Tcka3zwVnpCHY+CD6BRg2rwOfrkdyBI7DizBcWRMtu6G+MZAEW2
	 t4fzp5qnp75/gclDvKK0fqhc4QZ/On67N2zCvAYSH754M2fISCnba/M7M3FyoEuq/m
	 lTJw4kZ2pxR5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5FAD5B16F;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/4] Input: small nitpick fixes
Date: Mon, 15 Dec 2025 15:30:00 +0100
Message-Id: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGgbQGkC/x2KOwqAMAxAr1IyG7ApDvUq4iA21SxVGhGheHeD4
 /s0UK7CCqNrUPkWlaMY+M7Bui9lY5RkDNTT4MkT5ksxy8OKwVTIiSOlCPaflf9g+zS/7wfDWL/
 wWwAAAA==
X-Change-ID: 20251212-fts-fixes-30253fde92d9
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>
Cc: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=687; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=AwEDboNk5GmPqrs+ygIr6oF3UxdqLcCX4eLfPid2KXw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtraKyNehUYf6Zq6STWquVGzPauk3f3hyPmo
 SDg/syWgFuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 cnymD/4+NtvqTd1F7d46ZcugHEDVrc8ViX33x3uIbtImJbzqS1A+MAec4i6/CM31tn4plgGWqWy
 6EypuPlpKe3sXz0yXKC6JeGjQA9mQiuKldrE1AyJSOI2wN+YlY+j1mjfwSETttukIHytCTV0nbf
 irO7tc+AFrOzqBS84eAj9ndDdQp7LCXjSBznGgnCLJKzREM00nrKhlZMxgI7sFbDD3yTjXNPce1
 M+XR7AYGoHD5B6hNRAUDEbXY/7+BFRCkvgEozGB+A4uc7yqaPDU1ILb56vfj1IavErElxFWq4pt
 j73h/x7YHjrM3RsZAjAMaEpAHp162W5xOCfYzVmcW0Ldch+Cd+3pxGYsFayjfqq7V1AukSQy94n
 1wgsvafywp/tx8HPPNQf/GWLhhOhUFzJR9s3pA0HQrDcZte6mAI+m1mw3GMg4mAyR3Y0rkZHqv0
 prczUCdbQbTjBsGu+bhigFIMlCnwBm96sYKm8Dipxnfro++8FCv/RWfuj2CUOa0kJuwylkmT9RG
 HOlLXX8pcQdXOpZPwa8vGZoZvZcox/6BETTxeCARd9R1txymFGXBY0dPXvcZ8q6KF/0pwKwHKWE
 uy8fNM5yr9XrYOCMLDOznJL8huvL/ZiRudqnhXqaVPIdmDyIf5iCm14FRfejA/MSEwKg7FKEL2h
 sVYg2BC42MPHhNw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_063006_965282_3D220743 
X-CRM114-Status: UNSURE (   7.68  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Feel free to ignore the last patch, if you want to wait for FTS5
support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (1):
      Input: stmfts - correct wording for the warning message

Petr Hodina (3):
      Input: stmfts - Make comments correct
      Input: stmfts - use sysfs_emit() instead of sprintf()
      Input: stmfts - use client to make future code cleaner

 drivers/input/touchscreen/stmfts.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)
---
base-commit: 4a5663c04bb679631985a15efab774da58c37815
change-id: 20251212-fts-fixes-30253fde92d9

Best regards,
-- 
David Heidelberg <david@ixit.cz>



