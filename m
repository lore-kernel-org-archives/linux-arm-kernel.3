Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFC1CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYe0UsBMCaRl/SSTsNMvYXizf5N50Ge9yNyjOI2yeog=; b=K7EZCQUlSyIJiDAxJzi8sk8vml
	fx6R3jP+aVbvfbwzz2M7+n2htQ73NpkfEHnz1UeCYRpUMXDNDji955BPOzQjJQRCuKCwAT1vIzUzx
	4tkx00hUM/BvK7Erdx0ebHH7XqGuQsRQh+I1G41I/dEbYQvcwPkjjymwCCimVUFqZq1NTh5+MItoy
	eeb9GsFnrrYlnOs7mPVD8WF9ibzWqY7gW1TdqF/7hf7j63E9DlqVhVVRcP4DTqijbIG7JKQEeqlxy
	EBqwqIcwC5d/wiY58lfPdwQZdxrAiUpqQK2cdfGzqrxTen8k5I+4v98TJXZ1ak9xJe2hABYvo1kzy
	XdmYCSkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD8s-0000000FuHl-3NiR;
	Tue, 05 May 2026 10:36:42 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD8q-0000000FuGm-3Gb8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:36:41 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso5424934e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777977398; x=1778582198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYe0UsBMCaRl/SSTsNMvYXizf5N50Ge9yNyjOI2yeog=;
        b=I8/mx/z4Cjdnt7/uBs2Jmjn7sb9OEOL89aM9CNKXG/0pjASy1CoNHghEIfS42Txi/B
         UYKPdsGzxQh9182rtHtZfkAPMyOTLd2ZMTxfdC6uGs9GbtnhR6TDKNXSCnJ76pXFppAa
         K9zStiVgNMbTqvPZ6WgsF/om34GQFORCFHRO6iAJ2gynMWdnLDXp3lN5FT5S+nxcQD/Q
         oWwSbcbx8BUOQ9rp9ikvrJPnanJorloUQ4TfzGT+XLyv0Kl9QOOTnVT7FAXc4NY1/gaP
         q++IB9Y1NO1WvVUOJclCLclYKgmgDmxjIxmNPaaoiObYbpg0P5CVx7JKglG7yLReqrzn
         e1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777977398; x=1778582198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YYe0UsBMCaRl/SSTsNMvYXizf5N50Ge9yNyjOI2yeog=;
        b=ICOt8mt2Z2Nhdo4Ms/5jwH4FZFHzs+D1KXJfaDiyuCh+gW0P25IWusR4gf2o2WgSQX
         xckAYXRUazIh8CgaZFZTfMWQvHT2B8ItZSSd2GTWS6xMmWBOli04iJRnyp/imu/GW9GG
         CazqquC0LKIPB0+8lKj5VAd2dw0PLOD3B42ZNl9nX4FWeTYXgmLHwoKE6aACWMmgA6JB
         xdN/U/vCHezc7h8MYZLZXAT5Df9Fuy+1wfXi7MNgkC/DWkhZ2eJs3Yx4oZtFQx6EdP0w
         0sHW5+R364FaV0ldhxKBzd76mwi3Bf4ZysVZhfhf1XqrT4bnyybHMrXmpjWJ3DD75odH
         PLqw==
X-Forwarded-Encrypted: i=1; AFNElJ803d2ncrlu9UdfcsThF1fxLv+2EyQlRPZ5ymfVMtancVOZv/P/urp/w8I5RgrNPIkdUHMgOlKCqZsd1Jn3pc7P@lists.infradead.org
X-Gm-Message-State: AOJu0YyOHdFisis+s8PHeAg3Ri5KBxTDHGY5+UN2BGKaQ8IzsQvMS9nA
	47d6iehqKLAwxWAF46XIadK9lvlVcYyTn2QxUrJ43ZNeEwNdqaItLLB5
X-Gm-Gg: AeBDieujguIM6YCkroH9Nd7CEdrE6BRoFFKQ9/rHdQu/yVdSwiKbmfpfgcr0oqbJtR5
	iz8MIxyocB7iSu3eL2M1KOpnTymg+g7HAjVrvIaDezsZTB2wCC492PLgAnrh0pspd52EVZbzquN
	Rq2fX03CgEqB8y/+KGdS0rQhaFoiPelGgZF5QtFhbm9cdSOarq4Xxgl93PWuywaWJs8je1SNt+G
	+doXO+UTlfZojZtuYqC1jUnBeIE+ontkJUoGNbr7U8+xBDKpkWMONY5UaOf1reQrrWoA0C7xzWv
	QmgYg6EMNT8yYgLwRUYBtQO9vl2lUe3SVDgKxRFCEsoHGOEni+lvJ1QFH646Pl1dc2K4DbWhH3/
	yvJYuqOfYB6CNWj1m1ZytxzEu4p+FPKjBa2j/uWuUQFqGR6G/KcMkPLeasuVMkfyT3VyW9FSy4B
	8501uIIDKhMjSMunwqK6L1CwJ9vD+wwZ6rLQuACHQeF93THVqPn/6VDObUi+BA7QSndMBkJw0=
X-Received: by 2002:a05:6512:800e:20b0:5a8:6391:4fe5 with SMTP id 2adb3069b0e04-5a863915030mr3062779e87.26.1777977397888;
        Tue, 05 May 2026 03:36:37 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c341848sm3774443e87.65.2026.05.05.03.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:36:37 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: Re: [PATCH 1/5] perf/arm_pmu_acpi: fix reference leak in arm_pmu_acpi_probe error path
Date: Tue,  5 May 2026 13:36:27 +0300
Message-ID: <inv007-withdrawal-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1777889235.git.vebohr@gmail.com>
References: <cover.1777889235.git.vebohr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_033640_839220_7583F01F 
X-CRM114-Status: GOOD (  12.38  )
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

Yeah, you're right, my bad. The `arm_pmu_acpi.c` patch is definitely broken.

Since `spe_dev` and `trbe_dev` are statically allocated, they don't have a
`.dev.release` callback. If we hit `platform_device_put()` here, the refcount
drops to zero and triggers `device_release()`, which is going to scream about
the missing release function. At best, we get a messy WARN; at worst, it'll
panic the kernel if someone's running with `panic_on_warn`.

The kernel-doc note about `platform_device_put()` is really meant for dynamic
allocations where the release path actually frees memory. For static setups
like this, the original code is actually the right way to go.

Please drop patches 1/5 through 4/5 from the v1 series—they all suffer from
the same logic error. Patch 5/5 (mfd: sm501) is the only clean one, so I've
re-sent that as a standalone v2.

Sorry for the noise.

Valery Borovsky

