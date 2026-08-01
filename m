Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D3DC54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 09:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bfyzMu9d0j7FgF4V0+W6tNCDJazCXFwoJSVzR2XoTJY=; b=m+D2SZefBIOviBGF0x9/IHa+AN
	t6/lgqkN5G6HkFv131oaNUiumqP3u+ZP29OxX/wNIP7EbAbo+rwWCxFlqUGU3TQlUyRpFxvk8UPgc
	fbTnGPXKZy/pj6FcKpJnQcexEwIjGKyZctFnBIaZgcOfoUKzAv93dHuW/qDMGU9gSHjezV5TbvdG+
	WHvZHIR9NMFEFypJpg+U3J8ONwx/Rrn+VCDTkH2d2jCpQZlbt5y9MUar+RiAbiMLpzqmg0ZgDtdlU
	H6HKD3owwZ4SuxiS2xehXrfJFJov0099MMvv+bj5nGVQlf85P0scM2yKwWjNhacv9GAVoRPAoh0U4
	XrXlAxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5jd-0000000E6sw-0AhH;
	Sat, 01 Aug 2026 09:10:25 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5jZ-0000000E6sU-4BBR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 09:10:23 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1790637a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 02:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785575421; x=1786180221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bfyzMu9d0j7FgF4V0+W6tNCDJazCXFwoJSVzR2XoTJY=;
        b=pdMCZVTjDVIc8Je2wjaaAqXwCsxtkvtj8g91MWktYCnDXYXB0p2UNVsL/iFQ9e+rR5
         D78qzMIIQClGylxAbLQq/ZsygVJ6D+Z2R6aJDguKqvVBf6fmMjnWv/MRvOBBf7paKNTp
         XAM4sMPs82+Vtbtu/3Ph30AsnpokEcghtVHw6m9TVMSjeQ27tw02brT8FqxCux6aqmh4
         WL7vShPVei/+mrhlpEURvmHNRmQqMdmIzB/iAK6efJ1+xIpD3M/XO2sTDBY/idjIPbSJ
         uP086an0hb6B4V8iEoqNidn/kLBL+RYZ9xiyuBE/B6nwpCE8KKNyURinUxG1iX2EjOdl
         w5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785575421; x=1786180221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfyzMu9d0j7FgF4V0+W6tNCDJazCXFwoJSVzR2XoTJY=;
        b=aQtrHW4Dhzg6gg4dVH/wadL8wVPleM7SJYy50IlyII5u2hLiboAJT/CXCnBuQbO7sA
         Q1/xXYfWdNUk3EDIraDWLU2zEg14g8UyenywG6F2+Nyk5LxaDOzjH9GmdnccEFgkWaV2
         6gqxSz0WoQsJ/81sbDhnPiKu3hC3NGnyYd6RE9WxUxaGDSARvKuStjEof8xMtzD3OtXq
         584MTPOHhCq7nhf5SPcGBmgaEhNsvpvj0vntu+OmHgtxEtZa398WzLpJOuSD2LL/eQvc
         9IOROrPGNNME9FkevMf7SolRWJFuXej4sdhGn4zn3hGQr5+fJGgjATu6xuTkPLRxTot6
         ITbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeeYFUpHGDLNge8ANS8O8uU5yBbr/nl/Lu/FAIZVma0b3BW0aj7jiaG3VjbuT2ki5WfNtfV5yLfnRidHoQvXX8@lists.infradead.org
X-Gm-Message-State: AOJu0YxXikbVxKtisMeacyb3h1Dx/Tg4/+LiExx5awcHn2f7FjZrIZDj
	t+gg2S9rzPTIAaaEoCSOGyx22skpkvREIK1noqDwa0o+Suv8A/5ycjg2
X-Gm-Gg: AR+sD13kSeHWVtMRO+r/n9WaQqBvp2UpLEUWp4jfUgR2rdqB9qtK9W/ZeMBVCw3LJ9B
	oTtGvazLm57ZYlUVA2XH1KR8bDupMCyMKQDouDH93hbxwsmHnHMGLf1RdVgjsmlieq0XvZdeed4
	eU5AsWp0AxTS7o7RR1jO7V0ZfFLP7lRIMeJjLYwyT8/b8yH+TWlco/cX30KvZ4viXMrR20s9+NC
	lyP4dEn6jFMxCAAHq4Q0DbOE8rQmeTLl782/0V4GtmDJoSDeKqzNPhBApstvu5CbqolFRfoAtl1
	Hnddeo3pQH0zwRqkPyq8CRqfcux9BpQjSvb8Md+d+kh/gy8rwkObq+O6A1JgFDij55xAnEyyaEe
	4RDcOhKUQHxGFN+sC0Oi1+tLitiZobe6IC9JDAGio8VvwznfaDJkhpIk9ZaoMQtwmPb9WXafI6w
	RWQ/TPyjCWpELyvqXg7e5jW3AKUP0I6KNexF3Oo79neo91GWg7dLIrEseh2Q==
X-Received: by 2002:a17:90b:2dca:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-38fbc408af7mr2717365a91.5.1785575421063;
        Sat, 01 Aug 2026 02:10:21 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:36ae:7de2:5cca:938])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm15432431eec.7.2026.08.01.02.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 02:10:20 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Joshua Crofts <joshua.crofts@broadcom.com>,
	Broadcom internal kernel list <bcm-kernel-feedback-list@broadcom.com>,
	David Lechner <dlechner@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v4 0/3] iio: adc: bcm_iproc_adc: Simplify probe error handling
Date: Sat,  1 Aug 2026 14:39:50 +0530
Message-ID: <20260801090953.61603-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_021022_079964_6F17B9C6 
X-CRM114-Status: UNSURE (   7.57  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Hi,

This series simplifies the probe error handling in bcm_iproc_adc.

Changes in v4:
- Move the redundant iproc_adc_enable() error message removal into the
  cleanup patch as suggested by Joshua Crofts.

Mohammad Shahid (3):
  iio: adc: bcm_iproc_adc: Remove redundant probe error messages
  iio: adc: bcm_iproc_adc: Introduce local device pointer
  iio: adc: bcm_iproc_adc: Convert probe error handling to
    dev_err_probe()

 drivers/iio/adc/bcm_iproc_adc.c | 54 +++++++++++++++------------------
 1 file changed, 24 insertions(+), 30 deletions(-)

-- 
2.43.0


