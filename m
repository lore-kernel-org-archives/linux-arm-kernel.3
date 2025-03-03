Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CADC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 06:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QSZbgNGYKxBBihUiihRMM3Eu6IeHMnI7bsOvB96WIr8=; b=ZaqS+UkGE0EBuzIHq7GKfcp+8O
	Dg8fMfbgEp1xvHrSyzY2DCq86GCGPGXFRM4YHspH/hlTaHR1veTejwA6tysdgmjEE3RmyXIBFLpkN
	VogLqmnl3rq+Ct5jVhKv+WM5TteJWJLsIXKMWMlRWU56b+fAgo2rD8j2kxHGZkTQ8qwEoxB5zCBm3
	hjnyadC0c8J39kMx/1XKhjJ4MOEpAVm2IjcerDdC22CO2tIlU5jWz20B59yZyZAIVuT/6TxVpFqkh
	huhI7y0mIKCp6WpeM4h33G8Zyic6l9dfK3LG/9230ekZPJFZ/6rphx6+K7HrsOF2uCCAQaPdDNfhk
	0ZZ53NzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tozd8-0000000HM9G-3wpx;
	Mon, 03 Mar 2025 06:50:22 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tozba-0000000HM4p-20EJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 06:48:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2234e4b079cso71393655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 22:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740984525; x=1741589325; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSZbgNGYKxBBihUiihRMM3Eu6IeHMnI7bsOvB96WIr8=;
        b=FjdhygxI+GssLNbSXwiTBNU7H9oGshI1hgHi352ilCO3DTO8r4LTsUAnor41gy7RQE
         nzkV4hOGh2w/2EEW7kgtIv5x1psfIpH2n23EiapO+Mw/OgXe+wgk2Mqmb6QYFj4g5Xpn
         DWfpDeGoZd4S0BWtI7AjYtmYJoda5j9DBms6TKEUmtT653FyovJIMIXhWkFT6CcscFgc
         AGj8IGUdxC8ZMaUycOtQRdiftAin11uVAUy3HtWVOlwlbeGy1Qc3zhwrp8FKF+Y+sslD
         Ucm0rxeBq7A6mgoqlzGNyCmvYfZAxB9lUUirRqE2LvQ4BXBsffeIkvz3OG+Bzn2CphOf
         YmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740984525; x=1741589325;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QSZbgNGYKxBBihUiihRMM3Eu6IeHMnI7bsOvB96WIr8=;
        b=aXv4HoMa7ktdcoKPw29rw3ztyHaMcDArUdFl3G0SLdHNf+9VuKk0N9ZY6HC20QTc3N
         OGkOL2sZNr18VZtSlcXLFQOcMEUXtfei3+0MeeqL1HV3DbwUxpOM8YOU0ySvE5v7Z6Nk
         pmOZb9Lk+XgGcNWsP1r0/PeQ2lsovwiceI1ccBqtqP8wXhW0BGWjLJHyzj/ivT20uFSJ
         beCcsShK94dR4YzBMyGlRly6yA1kM7dC5YnlHbMd2yyBN2T5SWdpCdu5MIEsn2Izscgi
         c/cqLzP3XlqdCO8JjO2QpDR1JutrKvNyj04/8Le8ndGmN9hslpUsSmhgLsS72ghlrXLm
         mPEA==
X-Gm-Message-State: AOJu0Yx5Vu6Cx3Z3S2GC1W5VRq7ak2zhhWGz+CuPDITJnVsqGdd94NKh
	oP4hOGgBetOUh3DoXdmc3toRu3Cac16Q61pe8umsy7GdQpfc6Q/j
X-Gm-Gg: ASbGnctqjB8SN93kuQU1IARjU6cXdNj9w6lICcpu9cH/0LzedhnLrnMqbG5C2U7R+Wf
	8x5SokqEFllEdwH0jIxry+GbVN+OX7UswBzBW5EJynLji5vvvv5kpN5v+rmbEpo+ruUCoPGucRv
	oLpPe6N0Qq7hLg4ob+JOWensvD/A5B+XER8WjvLfPRj+ISbQX6NDUGacLVKuci6/y52hUqqRqkn
	lSRNW8EejNKmF6v8WuRZS63pxwCnmXlvSdtDJJe7fg+1fe8aMjSg5CzToMRrFMVhWVxLpCWtus8
	7rUMHT8XBiP56l8lWai8FPF48nJ9+BLmS0lP9CupigkUa5nR1uXP6cQ=
X-Google-Smtp-Source: AGHT+IEA1hJKUxyqA3LqCYci0qeTbUzcQpNPUyQbmM5kCwjJ7k0HdhHQIwOWW/ooFknj5MyhKAzw5g==
X-Received: by 2002:a17:903:198c:b0:220:e1e6:4457 with SMTP id d9443c01a7336-22368fc987fmr204482065ad.26.1740984525199;
        Sun, 02 Mar 2025 22:48:45 -0800 (PST)
Received: from [147.47.189.163] ([147.47.189.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c596esm70571005ad.152.2025.03.02.22.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 22:48:44 -0800 (PST)
Message-ID: <76e7268f-c4e3-43a3-957f-b7246d953c6a@gmail.com>
Date: Mon, 3 Mar 2025 15:48:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Kyungwook Boo <bookyungwook@gmail.com>
Subject: Null-ptr-deref in xcv_init_hw()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_224846_512592_713A0F60 
X-CRM114-Status: UNSURE (   5.30  )
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

Hello,

It seems that xcv_init_hw() can be called in bgx_probe() regardless of whether
xcv_probe() has been executed, leading to a potential null pointer dereference.

The following is a call stack example:

bgx_probe
  ├── xcv_init_hw
  │     ├── readq_relaxed(xcv->reg_base + XCV_RESET)  // NULL pointer dereference

In bgx_probe(), if the PCI device ID matched PCI_DEVICE_ID_THUNDER_RGX,
xcv_init_hw is called:

pci_read_config_word(pdev, PCI_DEVICE_ID, &sdevid);
if (sdevid != PCI_DEVICE_ID_THUNDER_RGX) {
}
else{
    xcv_init_hw();
}

However, xcv_init_hw() performs an MMIO read on xcv->reg_base, which is expected
to be initialized by xcv_probe():

cfg = readq_relaxed(xcv->reg_base + XCV_RESET);


Could you check this?

Best regards,
Kyungwook Boo

