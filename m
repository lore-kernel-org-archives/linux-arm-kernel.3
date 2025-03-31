Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C09C36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vdfZf6Qf3Rc2A3D8YxoEXa1CISDhOTToLVsDJBTF8Kk=; b=y3ZgRxuPwyO13CGxHBmxnu3XdG
	2zBFhAq5WpNq7T/MlSMDqpgT6pGv5cOU12ikOF0lsfAXz5MwGHHPefFVdw9lQEnDtelRSGdqhggQS
	c9NfhUcK1PXvs/N7S9lNlyXjNJkeqeOKzpoamvMBVLRBbubjssaHEeRJzTa5D2Zq7jOBe3zMn8BDW
	gxArvFCbHrUAM5YmeNVb36Ur+PlST/qrjGFV3zOEweSAe7XFxprQFKW52EY2B63dqeS5PgzhhmtIT
	IDLWn7nOmutFv1AFcrR8Be/R49/Zqc18czoOkoL0UNAqE5vKVNjkY8iLazqdOMY54TCG13K/noK64
	3PTNt6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0K-00000000068-3xi6;
	Mon, 31 Mar 2025 10:04:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBiY-0000000HYNS-0qAW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 09:46:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so35255825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414364; x=1744019164; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdfZf6Qf3Rc2A3D8YxoEXa1CISDhOTToLVsDJBTF8Kk=;
        b=rpT0qXYsCV6zle2Uj9EjuUMnIK57vuR68ZKocQDuPJcKtCSjf3lpSexuwOdj78p3ZG
         HrNKMCgTMEu49BjjBsSJKOFgFU9wLh5GxnFd0oM1M7hlCmRydVDYJDp+gQsgD4vLyO5C
         VOVVXTNmeG01da535xDFMFQERVGA/y+MUVcDhgwzEhwBJvxZQnea17I+13QHyi1WYjn2
         jSBvEIBnld14nmeG/M8nftWZnLgCtan9pTMGCzGJN+UQ/CDHH4eP7ZQTbe10rlgo5HMu
         vJCEb2gQ84xzPGJBdgt94VHyacFVnfo/XOPQLSh3UcdAfGcK57GOXLpNu+nozQcZzCOU
         04ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414364; x=1744019164;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdfZf6Qf3Rc2A3D8YxoEXa1CISDhOTToLVsDJBTF8Kk=;
        b=gLHfloUN0RQTXZtqOfcMiwg0vrOB47KYASysiOAHFDFrVYCyMnQNIFb7jYy1837ml+
         jjnE4OMyGqT15cwo/6PRuMv6b1HFZh5qUOVIL/hrvRbAJc9bmzC5ajuHdcJeM/IZ20CZ
         yOCfebWPTsqtl9f8nCWumMCKI75GtOIKPo9bVjBq+MzEXr8p3GDh0YAkHo9pMojUQPiq
         6G6fxnebf3nZvCHfT/2TabxSeba15IKWG3hWD9Dd0p1cxlA8U0Xn87qwABs5AhrIBKGG
         TnDtom3kCN00QINnKv3UofXFdfo8L12I2xJ51eigF2Dw+cRcaGPTGVJp8+5lRt8V5l/u
         n4+A==
X-Forwarded-Encrypted: i=1; AJvYcCU1Ja9ip5A2KpBoKveNxvEdATmoc5EwS5rTgNpH1Fv8bN9VN20c4yQZ50Gzgri8qKnYioKuXW7TgjWPLaTOhR5Z@lists.infradead.org
X-Gm-Message-State: AOJu0YwdaS3VCUz3EnT4iiOyiGSxq+RD1uTafOmk6Bv3yN4PjOVt3IdT
	mRC3vgmYpCbTURAeJO9uFaAzktI5UUEv02QBN0zAXYtGQDL8R5Fmb+sXv/cfDtM=
X-Gm-Gg: ASbGncuRIiR65GV+m8ct1lEZgCrT7qUzV8PZgphEIrKdW4Bko3TcT0pKss9u6V52Sli
	sY8MjDWH2JCOmCDbQf8tas7dX7e8n/yk2MByxNj9kfoSRQT8yh5BAmb7F4235Gu4YKT2fqvpXDJ
	sg9yc1rmC2SB5hFSHw12yxvCtGVy1ZV6Pf97GF0NA7nmbiDCwd8dmMa4apIBL3E8YAV38TjVGwk
	rmY+U7BIQFcVU2CJa/eVAsupXqLGgRM+M4nydnH0atPNgeYPGjA2wkhs4D5+y9nvlqgZs8+AD/9
	T/9dyvvHumHaumWbzzhuIFtuSgaVAsQfVmsVKrV0S6v4GYOsow==
X-Google-Smtp-Source: AGHT+IGwVTWwoc2dmQj/y3w2I60/EBThtOQJYUV6tW7X7RY5Of9dMyc5g6yuGtRo0dcUomun/LluaQ==
X-Received: by 2002:a05:600c:310c:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43db6224034mr54503175e9.4.1743414364456;
        Mon, 31 Mar 2025 02:46:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d8314b6dbsm161982895e9.36.2025.03.31.02.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:46:03 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:46:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [bug report] soc: apple: rtkit: Port to the internal mailbox driver
Message-ID: <dfc20338-680e-4ae5-a569-f54eecefa0c4@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_024606_235967_40BE8AF2 
X-CRM114-Status: UNSURE (   6.69  )
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

Hello Hector Martin,

Commit bb538effdc71 ("soc: apple: rtkit: Port to the internal mailbox
driver") from Mar 14, 2023 (linux-next), leads to the following
Smatch static checker warning:

	drivers/soc/apple/rtkit.c:696 apple_rtkit_init()
	warn: 'rtk->mbox' can also be NULL

drivers/soc/apple/rtkit.c
    686         if (mbox_name)
    687                 rtk->mbox = apple_mbox_get_byname(dev, mbox_name);
    688         else
    689                 rtk->mbox = apple_mbox_get(dev, mbox_idx);
    690 
    691         if (IS_ERR(rtk->mbox)) {
    692                 ret = PTR_ERR(rtk->mbox);
    693                 goto free_rtk;
    694         }
    695 
--> 696         rtk->mbox->rx = apple_rtkit_rx;
    697         rtk->mbox->cookie = rtk;
    698 

The issue is in apple_mbox_get()

drivers/soc/apple/rtkit.c
   283  struct apple_mbox *apple_mbox_get(struct device *dev, int index)
   284  {
   285          struct of_phandle_args args;
   286          struct platform_device *pdev;
   287          struct apple_mbox *mbox;
   288          int ret;
   289  
   290          ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
   291                                           index, &args);
   292          if (ret || !args.np)
                           ^^^^^^^^
Should we return an error pointer if args.np is NULL?

   293                  return ERR_PTR(ret);
   294  
   295          pdev = of_find_device_by_node(args.np);
   296          of_node_put(args.np);
   297  
   298          if (!pdev)
   299                  return ERR_PTR(-EPROBE_DEFER);
   300  
   301          mbox = platform_get_drvdata(pdev);
   302          if (!mbox)
   303                  return ERR_PTR(-EPROBE_DEFER);
   304  
   305          if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER))
   306                  return ERR_PTR(-ENODEV);
   307  
   308          return mbox;
   309  }

regards,
dan carpenter

