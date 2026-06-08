Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0F8CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lm8hR6tmbybGkch7m6sNCS2QOC7j8b++reuYvr6mkvI=; b=b4zB2RoIwinFtkO3a1Nw93IoJY
	s0hMsM+KuMtxnoZzMH0fhFtAnJX6H/50xlZVuHgHOWDxEkumiZkJipY/UhtDQlbAo3r4hFWiGjE2B
	kUaHRnAEVPLKLRfWOxbot0/j36C6Ds/OyM1QCw52RaKGLDqxk2BmdcdO7YkwHQpAtaCEyMod68vLd
	+XCwzNOFgVdrAeoXFAqtybXZP14Z5DnV68zQJB4A9wv3smRuwMMA/c98ZsUBQPdP42gcVCMNXvUKE
	wrc8X71AXwFB95h3nBhSKIZygouEZ5qLxTJLhEqN0IAEktrVOP8TWEse7DzZUZtMHjF7IhakTZ4d4
	gZbl2IHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbMg-00000003sc6-0sRR;
	Mon, 08 Jun 2026 14:54:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbMc-00000003sbK-06jy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:54:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45ef29c5561so2302651f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780930443; x=1781535243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lm8hR6tmbybGkch7m6sNCS2QOC7j8b++reuYvr6mkvI=;
        b=BS9T244ANKjdCWSIL41n3Mk9mOKuOn1hhXyCq6uIp1QonpOBNbUm5A9OPHoWWAOD8I
         opCuJF5qNnkuKXIbg4B9qB/1cGV/JF6xo51wUa85Ydohvjv81Aly5TPSc3Dof6iaB6Fm
         Czvix85MPji1Do2DCBPNY97rIE0PlC27XtxvDshL8c8/mjukbtlyMWOTgFECp38AEkK7
         7ITkKUIwZ4AWw2VRzv0sbaa+vPrJiqkHj6yEAkrOgtHf3IQrKe/KXcjFiXTbVUOvuxQL
         uWTc2z2Ss0LQl3W/mvSWC9e6mpFkzkuAQUwQ6K2KY0Fv7o39cYiMDc4NO8OfiWcZpZWg
         Wu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930443; x=1781535243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lm8hR6tmbybGkch7m6sNCS2QOC7j8b++reuYvr6mkvI=;
        b=nKPkgzLGFf2uDfPcT2r0AsPtyTDtMCTLQH1DHUqfRs+bj6uEK1S0cq7miX6uoBfqVN
         Dblek3LPoYYayy49mrsTqeIR3Al3uZZ3vS2nqtOyJ16Dx3TLSOIPSaGQKBmSyZCph8o8
         5CtmnrSS40d2GLChwPXYdb68xgg+4+SMspX2qKwR2QxCdFBuUajpk8euORl4ndcUfDIT
         /44s4z+DbhxB7RffUkv0dNrB3u6U2N8EuE9zcbkTxetk+W77D6z531mNHYaTkXygMgCJ
         oZx9IdcMhO5SKpp1VDQWt5xEmWGWbjQJ7Nf5NZiFGuU83C/+DsWRY5S57Gz4GI5yzMI8
         0wfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Qi10JtwdMubJIYrw4OxBQ/m3/h+WHx83bKWUFUNEAPoyA8rby0BDIl12WUL3jPzDVpR8OJtbsjczioGBaUlbG@lists.infradead.org
X-Gm-Message-State: AOJu0YyPEMZK7h/FdWS+an7vhKxkUfby6dCCDp3PDQPFBjtjmgRhZEko
	JVo0udjNDGNv9xxQ4sgJ39WePAHFYchja7vToQzqoIONGSTSUuWpIOPVKnNXX60zOM0=
X-Gm-Gg: Acq92OEUOwwfWuKTgrhLZYxuJrt8tsrut2Lc3z93Pv9L+oIvuOa5FOa/yMAuwg58jN/
	SEFArBXti7bK2ttl+aLgC9f6UJlDCsb23a4FEs3EZwfFV2xogDorJlZP2ML12EVnF3gqVIez1Db
	5jtN4g737ZqKvRvTJZeEqv05dio9QxUuETZPDfJuHnD1h53OlthjJlTpFwOGFVsXDgeMVKomJMx
	V5jnyrYIOoTNtGoO4LWKRjcYQ4DJXR5BJdEpIKsdKRewkZp1F4emzlUKhkUgB4pxG80Qq9n+O8H
	9FeMRRGKVbQV8bjcldrFNxWeM01ox77RTOlh3Z1T7ZZRbcZxsSBwjTzuQkhNE8hy+iLC6QDbmQ5
	+epOk1+TYLba0ST+oSAfbPExW6yh2/MtVQXAPgn50NXgPK8E9Vym4AyEtZ1brQSGWXBkYJPtgIH
	koImeFi6t57EZgRbjHdZFjT6mYRGFybbFPv7p/yx4SVluBcCuT8BbT//U2dPo3
X-Received: by 2002:adf:e848:0:b0:460:cfc:eb24 with SMTP id ffacd0b85a97d-460304fec2bmr20628232f8f.22.1780930443356;
        Mon, 08 Jun 2026 07:54:03 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm56927851f8f.36.2026.06.08.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:54:03 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v2 0/2] soc: aspeed: Add BMC and host driver for PCIe BMC device
Date: Mon,  8 Jun 2026 14:51:21 +0000
Message-ID: <cover.1780929570.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1780409151.git.gregoire.layet@9elements.com>
References: <cover.1780409151.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_075406_516634_93CCE0F9 
X-CRM114-Status: GOOD (  13.54  )
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

This is a v2 for upstreaming the VUART over PCIe BMC device driver from the ASPEED kernel SDK (branch master-v6.18) [1].
There are two drivers: a BMC-side driver and a host-side driver.
Together they enable host<->BMC VUART communication via PCIe. 

This v2 narrows down the scope to VUART support only, to address review feedback on v1 [2] 
that the additional subsystems (shared memory, doorbell and mailbox) were software-defined
IPC channels better used with rpmsg or virtio.
Those subsystems are deferred to a separate future series.

VUART data flow and MSI interrupts have been verified working on the test hardware.

Tested on:
BMC:
- Asus IPMI Kommando Card R1.01, AST2600 A3.
- OpenBMC
Host:
- Linux kernel v7.0.0

This v2 only supports AST2600; the AST2700 is untested and not supported by this patch.

Changes since v1 [2]:
 - BMC driver: trimmed down to only SCU and PCIe initialization
 - Host driver: removed shared memory misc device, sysfs doorbell, mailbox setup and message queue handler.
    Driver now only supports VUART registration.
 - Host driver: Fixed cleanup path: removed pci_release_regions() call as there was no matching pci_request_regions call

[1]: https://github.com/AspeedTech-BMC/linux/tree/aspeed-master-v6.18/drivers/soc/aspeed
[2]: https://lore.kernel.org/linux-aspeed/cover.1780409151.git.gregoire.layet@9elements.com/

Grégoire Layet (2):
  soc: aspeed: add BMC-side PCIe BMC device driver
  soc: aspeed: add host-side PCIe BMC device driver

 drivers/soc/aspeed/Kconfig               |  15 ++
 drivers/soc/aspeed/Makefile              |   2 +
 drivers/soc/aspeed/aspeed-bmc-dev.c      | 187 +++++++++++++++++
 drivers/soc/aspeed/aspeed-host-bmc-dev.c | 249 +++++++++++++++++++++++
 4 files changed, 453 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-bmc-dev.c
 create mode 100644 drivers/soc/aspeed/aspeed-host-bmc-dev.c

-- 
2.51.2


