Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB08D11702
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 04:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uv873R59GF4pDUvydCooybALtCJ2h5ZZnBbEItimlbk=; b=NGEZeM8EBAn5kwJs5xqrmOsL8d
	vN2qU7IS7BURfhbLfuLrFcPiqJa8SwSdeFMqD/N5xbjQeuH7WHjFgXVh6L7L6SfDpcGNdY5mNRz/g
	D7K6xkmtH8nGzftznjhzTMelRFqTB6eV0Xwd3IBEXY3AmTn9vHRpZ3Szb8kgqqtFGKHowYmgZPzxA
	GUl/4YrtOJ6EIWx3BFYaVlM28fh55/HPMsiNG8WSXkCZYtw0BeQkGLaN6dVp/TWJiTjnRaYEplLRG
	vcd/+8PtsB43zVT0pEK2V4DtBjEdj/mYgGFjAE2+kWDSCqzs30iF6dUco+hoAeYizarfmvYmMeG7p
	/olejSIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQI05-00000004mn5-0wlB;
	Tue, 02 Dec 2025 04:28:29 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQI02-00000004mmK-2VVF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 04:28:27 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2a45877bd5eso7562041eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 20:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764649706; x=1765254506; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uv873R59GF4pDUvydCooybALtCJ2h5ZZnBbEItimlbk=;
        b=h5vQZlavjKrk6eMvWjQ2qpKVbBzjYt/p8JIm5B+ghLeGnAcpf/6SQaFYVLHNgmQU0T
         uGe6KelBvEQ4jlWC7aSKuV9yrrkQlkjkGtmH0bH/Bg/ssohhf8TGQKj/WTmNfb3rBjIK
         /HBVdkGDYREkuCRiKHzIw4EIjJq9s+woupsW3Ez57KgN4apt/nSnz0uXQiD7AEpEfA7p
         Jbb3nXLYIynFpkv8J/MwIB1yA10JW2Bmym2HH+5lXdBEvjqdpCNNWbcQ6+ZfRuMM0+Kx
         /JZb5XV1TlSJ0Jc0CqFO2nl39EjjjNBXzsE2xT3o8qINOeFDIRH5/4s0ptZ1LK1F1Efm
         LWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764649706; x=1765254506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uv873R59GF4pDUvydCooybALtCJ2h5ZZnBbEItimlbk=;
        b=RcYEh9nNmpkxE9kXedOxas4h4VAQjax5E5gyrTtD+9gJvy72l/HscP0+7w5sF8gXnZ
         wqJQtAeC4oTHuHHThanLumR/sjLmIMKjw4QUNAOTFmDWDaDnNnnf/n/IBg4D1HiTei/i
         dvSAPIrYuyWMTntnj7u/0bF0yGwrMq4SK7j7c0f8yDe3KrwhrSQE8UzdLRyF4mpVwiXO
         wjO+ZwFTpRzE2+7KnPbm+Afb7kxLHaHHQqNggJWBuZ2Hmbde6e6LNfTQYdGyjq50Oj57
         ABd6baX4T8/LrEC55P3HznWygXRu6C2RI69bBX5Egg/dQhDYz93qZo1dQS3PvwSwBjkX
         +POw==
X-Forwarded-Encrypted: i=1; AJvYcCX8dEGZMuT5Dz4sMMKWxBmMUbf2NOQXJuyc0U4mrb9sjr7oAeFVnpZo3OmNEWZJagIyQETiwwIFEKlNONfTSS49@lists.infradead.org
X-Gm-Message-State: AOJu0YyPSe7MqP86BP2AyK4sruyL4fH4IHJvi3OOjSRxPQGJ1D7BDgUs
	hZlst6aN8gPpBGDiSLR4PjzXeY8PJKEVHkeF7oeJtF6vNvOhM5wDKXYFi629VvZN914=
X-Gm-Gg: ASbGnctXBfT+zt8daPaJE1H00RjmiLEmGD8d3HMDY0CQXbphVtV5zIkmMAjMpKIkHZi
	6BBKtJgqDM6B9Vmo8wNzlL9EQ+l1RA/aSVTMa5tnuuydsbkdViKc4fNtcZyfpQmMio9Z73+Nsb6
	qgcHlry2dFhlEq9q/DaqSVjmSv9cDCESIZSdy/h15DaEo3odmiCE2rHtjxG4pyeuA+6ihDd9xPi
	QTmomk1Nyf/TgMMhH6JkxIGVsUn7Cz0LfkGxxPCfHUO43lOuOA42fRsKHUdGNK6KZCfIXKxdxJm
	syw0s0HH8sLmvZZaT347Xp7zqq8Jkpj4JYHGDydxw2OfvUfPHsGHd8LykBDA1bk1w876k6NbzLY
	Bt6lkSgggtUkgyNL/XYKpicnFM60baMOFU7dw4VfnrcVDrvsyfM2/D6759cbLLSX3mCAz2YtlSf
	KvImxzwQzwXiFatnI9vQ==
X-Google-Smtp-Source: AGHT+IHz9/5MGJKnqrRQBBG71Tv8qvd7//uMmkLyg5Z6fy/L0/ZDmN2B0A/dYTxnaQjFO5ur+16uhA==
X-Received: by 2002:a05:7300:e10f:b0:2a4:3593:ccbb with SMTP id 5a478bee46e88-2ab7e661990mr930517eec.2.1764649705538;
        Mon, 01 Dec 2025 20:28:25 -0800 (PST)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm77426225eec.2.2025.12.01.20.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 20:28:24 -0800 (PST)
Date: Tue, 2 Dec 2025 09:58:11 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: huyuye <huyuye812@163.com>
Cc: ajones@ventanamicro.com, anup@brainfault.org, aou@eecs.berkeley.edu,
	atishp@rivosinc.com, bhelgaas@google.com, catalin.marinas@arm.com,
	conor.dooley@microchip.com, dfustini@tenstorrent.com,
	haibo1.xu@intel.com, lenb@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, rafael@kernel.org, robert.moore@intel.com,
	samuel.holland@sifive.com, tglx@linutronix.de, will@kernel.org,
	dai.hualiang@zte.com.cn, deng.weixian@zte.com.cn,
	guo.chang2@zte.com.cn, liu.qingtao2@zte.com.cn,
	wu.jiabao@zte.com.cn, lin.yongchun@zte.com.cn, hu.yuye@zte.com.cn,
	zhang.longxiang@zte.com.cn
Subject: Re: [PATCH v7 08/17] ACPI: pci_link: Clear the dependencies after
 probe
Message-ID: <aS5q28HPYLzK6h8r@sunil-laptop>
References: <20240729142241.733357-9-sunilvl@ventanamicro.com>
 <20251201141230.12656-1-huyuye812@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201141230.12656-1-huyuye812@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_202826_667935_2910035C 
X-CRM114-Status: GOOD (  15.17  )
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

On Mon, Dec 01, 2025 at 10:12:29PM +0800, huyuye wrote:
> > Hi, sunilvl
> 
> > Based on the above patch, I understand that you previously >resolved dependencies between Link devices and PCI Host Bridges by >calling acpi_dev_clear_dependencies(device). I would like to ask: >on RISC‑V platforms, if we need to manage dependencies between >multiple PCI Host Bridges, could this be addressed by adding a >call to acpi_dev_clear_dependencies(device) at the end of the >acpi_pci_root_add enumeration function?
> 
> > Initialization order dependencies can be defined via the ACPI >_DEP method in the DSDT. For example, if host bridge B depends on >host bridge A, bridge B should not be enumerated until bridge A is >fully initialized.
> 
> > Yes, that should work.
> > Regards,
> > Sunil
> 
> Hi,Sunil
> 
> I'm truly honored by your affirmation of my answer.Do you think this solution has a chance of being accepted into the upstream kernel? Are there any unintended side effects we may have overlooked?
> 
Acceptance of this solution depends on the PCI/ACPI maintainers. To help
them evaluate it, you should clearly describe why your platform requires
this dependency in the patch.

Regards
Sunil

