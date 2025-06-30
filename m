Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF40C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5aROwHTVbyl9D9zeojKZoCOh6LjGW5da//8YHEuJ/oI=; b=DfK9kD1jKUk8uErxS9936ukTit
	5NMQI8zygHdKs/cg2Gknguz2R466AYQj6n1vA/Y0Q2Pr0hz8TWD+BRPR2v2DeJ2SYyhc1p5Ond4yU
	gsbCbs91gDoeDRPjhvJFNhqwJ8HfGM9cQIUi7GU4n8BSHv5mtmPNnqaekIvFwa/jw5HZ988e86ezc
	RfWekdYWXDE94xYnFI0p0YcqagOFAwuqH+vpv3jQlYEn9/EMn8FqkO/17TZjuth+kjrK2cI2DJwD+
	dg9O0QaqIviUAsm5cWn3bXUKFf5Ka6dKtdGAGLr8UgkP07feyDCzlerYGfQIScjtBxLfBLbpfK0AL
	gN/hcDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGCY-00000002i4t-3Vvt;
	Mon, 30 Jun 2025 15:13:46 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWFee-00000002bK5-3KpH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 14:38:46 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553b60de463so2515182e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hifiphile-com.20230601.gappssmtp.com; s=20230601; t=1751294322; x=1751899122; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5aROwHTVbyl9D9zeojKZoCOh6LjGW5da//8YHEuJ/oI=;
        b=nXIneRqE+IcfREIUoxxgwYGzyY4XEOEz6tiH6QJIuRYxWxbZqwJFgt+Qs1MaqHrYhX
         9ol7VJ3s/VwtE2s8HYOwyrVShEgnomPjbDmeJz+WQVkHlU6RAhwSZO22xBLEJikqzfj5
         J5lxWS0/pSYcauO0opNHZD6iAPtQnc23wr/22Fl8gSOGms5l1gj24X8z3wobSq/kPGDy
         XogMkGjYAqUPKA5oUxLJvjzjPT8j1vBNfMx6Qg13mONF8GxGutDPggXZVU+TSVLPyJnj
         HNdvqH4ti7Zh8G568kaJJISu/zgHbxnBgXnHrHFJENELUEwGTfAzh/7Egj2ZrPDBSonu
         liDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294322; x=1751899122;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5aROwHTVbyl9D9zeojKZoCOh6LjGW5da//8YHEuJ/oI=;
        b=JtYeVVolcH3S9biup46ne6w+yhyupscbL53SINUv4dTwj5MpJ8bUazT8lFHBzlsIT3
         0CbZ80JzBEf3uzSa+XxxY1bqsNDSb0wwZsHeOMY4w4io92k0MzJQC4faM0CetA8fRI3j
         vagI6c/0CAxCuftP0p3UVR5mVC+zdm4b9xFofXMB2DO9g0+XCXnL8A/mVW0rd1Qox1h1
         JlSpUMxdEfJMzAVJoU7tLOBP4h/06823gAFI9tnrXxsHhepqn8kBSMG1QK+28Rg15DiN
         U+o0PNwvQQ2Kjaku6kDZsBNFwUtdJ0w3/nB3zqeYKhzP97ZhdFKOCGy6y6sNso/F2SRs
         MCJA==
X-Forwarded-Encrypted: i=1; AJvYcCVu3WgYrHanIJY7ObOXNVfPZE2lyZt+BHH4AryMMdjQOIH2Sl0C+kj8VRN2ZU1YNfMgHv2ITHx4dMZyb0/9Wvr7@lists.infradead.org
X-Gm-Message-State: AOJu0YxzXZml4mK5ACu4Kx7zJmbVjtVEoVlKamI4I2JiW5XHamJVFFsU
	3tDyzkw9EL7FkYyNdURWQUzI+dTMOvuOaN+oY4wq96E5pECdPJ51Ppy97XUAwDvj8m/PuP9zp+0
	gmPl6+t073VAne+Abh1GVi7eJkPxKjIeS0Yob+XYyRQ==
X-Gm-Gg: ASbGncscj23heMB57vrhiRMnU03P7iawsnPN2ZMlc0e52HJj0b6GeNdCpPxYF8yFw9h
	0os3bq2bWG4SfG13eo7DajgFv90DHK122R7eEr+r6+Ye4xEykXsdZKdeuTwe+uxv8OVLw4UQaJF
	7kZNaLGFny+3OhKhI+Bto88gZdwY6tup6PfZ8o+tXjxFc=
X-Google-Smtp-Source: AGHT+IFnqcLpgxNaCsk7PoNMYONyRs0hnLK3ll4UkAxFSTpn8mAkmMX5sbsExFDwtXdwFg+jhcuCDPedsHKii9UuAHs=
X-Received: by 2002:a05:651c:1116:20b0:32c:bc69:e91a with SMTP id
 38308e7fff4ca-32cdc525e8amr30785301fa.36.1751294322210; Mon, 30 Jun 2025
 07:38:42 -0700 (PDT)
MIME-Version: 1.0
From: Zixun LI <admin@hifiphile.com>
Date: Mon, 30 Jun 2025 16:38:31 +0200
X-Gm-Features: Ac12FXyz1YASyU_kIOho436uejsR4G8SmZtLl7LY6YsKeZfU1QFCNlm6WQE6lL0
Message-ID: <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
Subject: mtd: rawnand: atmel: ECC error after update to kernel 6.6
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-mtd@lists.infradead.org, 
	"SoC support'" <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_073845_071782_E83A3F49 
X-CRM114-Status: UNSURE (   9.74  )
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

Hi,

After updating our SAM9G25 device from kernel 3.16 to 6.6, we have
encountered UBIFS failures with ECC errors:

  ubi0 warning: ubi_io_read: error -74 (ECC error) while reading
126976 bytes from PEB 8:4096, read only 126976 bytes, retry

On the old system (kernel 3.16), nandtest passed successfully:

  nandtest -p 1 -l 0x40000 /dev/mtd2
  ECC corrections: 1
  ECC failures : 0
  Bad blocks : 0
  BBT blocks : 0
  00020000: checking...
  Finished pass 1 successfully

But on the new system (kernel 6.6), nandtest reports many errors:

  nandtest -p 1 -l 0x40000 /dev/mtd2
  ECC corrections: 1667
  ECC failures : 1205
  Bad blocks : 1
  BBT blocks : 0
  00000000: reading (1 of 4)...
  218 bit(s) ECC corrected at 00000000

After some diagnostics, I used devmem2 to compare SMC and PMECC
registers between the two kernels. All values match except for the
PMECC_CLK register, which is 2 in kernel 3.16 [1] and 0 in kernel 6.6
[2]. It appears the clock setting is missing since the kernel 4.14
refactor.

According to the SAM9G25 datasheet this field must be programmed with 2.

Manually setting PMECC_CLK to 2 (devmem2 0xffffe010 w 2) resolves the
nandtest issue.

Is the clock setting moved to elsewhere after the refactor ?

Best regards,
Zixun LI

[1] https://github.com/torvalds/linux/blob/19583ca584d6f574384e17fe7613dfaeadcdc4a6/drivers/mtd/nand/atmel_nand.c#L1058
[2] https://github.com/torvalds/linux/blob/ffc253263a1375a65fa6c9f62a893e9767fbebfa/drivers/mtd/nand/raw/atmel/pmecc.c#L772

