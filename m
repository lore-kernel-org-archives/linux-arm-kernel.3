Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C68EFD8FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysB8qazw9WdL090G1GcBnHN4qzpigP9WSIuSWTG5Q2o=; b=uV7tOpM+rfJmIs4a15bnKKWkuN
	Bbj2A+f30GurPlwUWQe2z5S8QD+S1jAHy04ljMFSLFGIEngUq5SSrk02dJDH+Z4hpTR0x+V1mbEaz
	0/dHYW8SvxTz1RUPSwYT8I19/6qG/Oxv67pODkjBFhww33t89BUNIKlzMm6zNLu8dXsStpPTUsy5e
	MxTfDSPxWWGsMEZPGC08ikZ2V39jR30H5kmcg93CZ94b3iwRzpLckQ3oLG7gxwBuKr3wdNi9yPbLE
	6drHKU6lr7BIi/PMAWnla7vdxR49EehzyAsBEmriVFo3l/qZyrnoyendF8TQxAWotaxMLANvaUfzk
	uC/Bb72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdGn-00000006VoJ-3nmN;
	Thu, 26 Feb 2026 15:27:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdGn-00000006Vno-0GsR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ysB8qazw9WdL090G1GcBnHN4qzpigP9WSIuSWTG5Q2o=; b=VygL0Zj8ztQOsui8cWWY4RykNN
	tg904BeBuVHfbAXvzU1VlBFIsBElT8dPinUzbkk61WIZogbHhfAGcDEDt2cc2Ad401vJ1ix5pG2l4
	secsDwW5bCunGUMHGJGedduEsC1FczDB0mY+KdOM5iyfnS/2vjLhlQ8ppTAUoD6QUgshIEz9zSfMm
	a7KCeCQD1kgUEYXZ2Aqa+C+MBGfQjNL0EbaMA+90npkCAp/AI8GmFp9D5+mdrjFbdNAgkdiUXEZn7
	I8Iz3cpFMsTa+43V0DLct9FOHSvQp1pUMwH+bhLeg7BGrxitH7Jb5g/AsS/fmhkL6KKLorQpESazA
	0TRX/b9Q==;
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdGh-0000000BJyT-45l8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:27:13 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-124a635476fso1099887c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772119629; x=1772724429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysB8qazw9WdL090G1GcBnHN4qzpigP9WSIuSWTG5Q2o=;
        b=DDG9jZQKlBzCW5BhXPXJA32mMnCsSMZZKA3dwlN5L6/cHeBZpmzqqFN69uxeEQ0zjK
         NhSPbKC920gTNpFOvFW0hO37LyMzttMjvYM+YnB5rCO+ClIK8nBSOyZw2bei95n2bK9/
         k7VqE9BEz6ann3fCx9f1I/fRJQptNmEX2JVJI2s9v4vwxy1NCOyPihsWcLAHHyCs+BAz
         tP7AYOmDD9nsufWiX1Zci44fCufPAmbcd1NRlX6GpXzcr3NoFTiUgqusq7we++tP94Uc
         lySo8xmykxNmjIxVdWzjguus0zyP75XdxUEvetovyd9lOQYw3LWQbWvSKKNPkZJDNm6H
         ILVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772119629; x=1772724429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ysB8qazw9WdL090G1GcBnHN4qzpigP9WSIuSWTG5Q2o=;
        b=p5vylbr0pBOjAO3e0Cavs/kSMAYT9Ako+scI5BxU6bSXswFgbQkIg8bN007zrMwBkD
         L8/Ni8e06HAMUocmLunx+NkV4MIQZv9YmCk640IHUrRMixTW4bvfCY2eCcDrp6H2hcRD
         D5msVRwaYLom6JzdU2oOD+Pvz/nXheqzKAE20CZgZVdIRhcTYkn+F8JICg67dSD8P+Tb
         sarW5Kn3VQRLA+0HuNX2YbNz54OkjfZiy2S1++S68tOixnx0IofbMqssGAAj3pGTMkrY
         2+Cy7DgVlZV/PUivnVmNDn1+8isaQGClmoMLbMYQa1IWz8CC4zIyzjH9VY5M7tl28t14
         7m9g==
X-Forwarded-Encrypted: i=1; AJvYcCX4Lz9OTSOVen7z+usvyxS7kiCcEsTtMKBMId2VwTg0yl+7yCFBTpyv5apr0m3v1GmxQJOd5Eoc78Wy3uIeRkSp@lists.infradead.org
X-Gm-Message-State: AOJu0YzlwvpIJtPbz3jtDd8jL5eIxt1L93PljgTkchG2TI4p9Wc05GYs
	JIYmqkxOkzJGUwSmUoNgMKqSPvGWdoUPPiGi37dr0WHplw+1DfWq3UMq7wWHt29H4Nk=
X-Gm-Gg: ATEYQzxaK8W7tI+jryUUktTKWGRMYVpYEguZGs3lTYh7JJTh8sGUpyZQPnvpYAo6BYX
	3EERrLaHrtnv5oWdF8UoOtEtJaS0p8PoPvBMl0SHfTnfTNtXGur4xr/cSNUBzB1RFYq4XY5EKsy
	AxYWgAKCM8cwvLnuBqD/jIRdEUD/mVg70OAiIckJXIdcjkZm6nnbyxeFsEo0w7fSOQ7iijF70aa
	l8dRsOiDmvC+9tEC9Gr9DE3CNbjLe1Afh4LNr+cPyeOeU9PdH+J5JWo9Y4us7/sVQai8V18rkQs
	jxLWQ8ehpEH53KnmW44IzNFqbymTa7w+dZ4kWMCZgnmfzFZoUPb3xtLUKXsuoyYNr0xFAZvSiiv
	T9jttilwOerWOVqzyYS8tWYcOqlBACM1bcTp3E0Os4lqGhtSK9Csh5IZFDchpmUZYZjxP/csD+l
	b8iHY2D68xIZruXNpU2dH0LaPjzMesQAzGS0tBEMeC0CGQNRuIPW51Wv81sF1o2Q==
X-Received: by 2002:a05:7022:4384:b0:11c:ec20:ea1f with SMTP id a92af1059eb24-12789ccb8d4mr1228765c88.33.1772119629259;
        Thu, 26 Feb 2026 07:27:09 -0800 (PST)
Received: from arch.localdomain ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899dfc47sm2694569c88.6.2026.02.26.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:27:08 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Date: Thu, 26 Feb 2026 23:27:02 +0800
Message-ID: <20260226152702.42051-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4d6c13d8-fd06-4cf4-9ac1-0a3e595092b7@kernel.org>
References: <4d6c13d8-fd06-4cf4-9ac1-0a3e595092b7@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_152712_158045_A81E258F 
X-CRM114-Status: GOOD (  12.65  )
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

> On 26/02/2026 09:48, Jun Yan wrote:
> > TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
> > equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
> > WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
> > one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
> > infrared input.
> > 
> > It was released by UQsoft as a blockchain-based terminal and is
> > now discontinued and no longer supported.
> > 
> >   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
> 
> This name and footer at that page suggests name "ultrapower" not "uqsoft".
UQSoft (Beijing UQSOFT Interactive Technology Co., Ltd.) is a wholly-owned subsidiary of 
Ultrapower (Beijing Ultrapower Software Co., Ltd.).

TaiqiCat A01 was released by UQSoft, with its product homepage[1] hosted on Ultrapower's 
official website[2].

It should be noted that UQSoft's official website is no longer operational, and the 
company is seemingly discontinued.

Therefore, I think it appropriate to revise the relevant information to Ultrapower, 
if this is acceptable to you.

[1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
[2] https://www.ultrapower.com.cn/
> 
> 
> 
> Best regards,
> Krzysztof


