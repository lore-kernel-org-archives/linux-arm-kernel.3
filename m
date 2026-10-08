Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B2CCA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqhjOrjahKnz2HWIqkVU83xsJUR6G8K08BAJhiFtEb8=; b=M1XJI0XVXU8R7uFch9mtzPhZrV
	1o5h7E0vC5OdLYmdecxuzqdlRZ0G6AbMyYOQqT+ub7rCpG2SIJtRY7PbQbgdvLh3sM0ZRFGRH+l1C
	eBaWxhixUsAprm1cjbAAu9OVdOX8SdQjbv1wkxx6U2cOI+ryJdtzL4bEexcL62mceEA/3oNN9HRsc
	Dr5bP6fY2VKL2G25b/IkKVSBxfj1ZxbE+4hDo2Kp58wHw4wes7BUnqXewEK6MYueJ/mHZ5Mbbx37n
	7uXnrbyGLy5A28S0MV/HxR/rob4WBOUHsq/pOF0XfsV10p7T+jp0v0+bl1//kXm59m4M1GeyqD0V1
	kaOgVnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEj8l-00000003pBn-3RWR;
	Thu, 08 Oct 2026 08:06:11 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEj8k-00000003pBA-0IOY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:06:11 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-88bc25fcd0eso4026104b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 01:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791446769; x=1792051569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqhjOrjahKnz2HWIqkVU83xsJUR6G8K08BAJhiFtEb8=;
        b=NwPzsKQk0ktOo27DhKD5kGHrxNW8kCkzNlYgbz+124Y467dTpH33UnUgBpkrfw0hSB
         YO8dlM1Mi/Rl14AdkXc4vXC/T/5OIVb0I061hTpIj6Ri0ewgfQWWfW7inWBaRRsiITd7
         KqaM/yYW65MzofozZH6wOE9rFDB8bfCZmSd4/c4Xpk6g3lQLvBeiPvAy3wiHmQOMvXlI
         91uda2TE2X2HC9nPP9JVmo2qc7JS4G7VILAnyLIwPX09raP9rxepAQiHpJoEFQ8xJpcY
         RSiXEMvme3/nKRVBDwbX7V3cDbK77+oRiGX0cAlXO5LqwHuPu7bqMKd7c17IGBZXvbzS
         U3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791446769; x=1792051569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqhjOrjahKnz2HWIqkVU83xsJUR6G8K08BAJhiFtEb8=;
        b=W8XZTpE/FKmyEOLSrzj701+Rik6diTTlC/ZXQ302FnDTH9HgrkQdCM8ZYxZnKlI3do
         Kt5LvycuAHmfTLflFSzXZS9yOTrdm5IXoYs19hsat6qI0oqHbB+RKgVQSSoQ+K2ONrRW
         M2TnZ2nYnbl7/HnYqSCqEI4yNU37tGo68FOQd0GoV8Go2NdelIigIGavyHdwrRpD5o0l
         tmMgOWm6VCsy//V3JYP30VSSStYWPbtjEC029d0mRJBkxw5wGeDUN3jX1oSZ1NrPVAcn
         eh4ascY66diQZqn8keh+ssqN38skWcP86UyGTohUv52o7fAQi4lK34c8RIALzNrOwtzJ
         6Xqg==
X-Forwarded-Encrypted: i=1; AKwUvBzbCc2keRxyzQcMb8Dfc6QJr5lAInLK3r97jEsFCfxnwDn6Cz4k4hxMGLNC7WcKrBGMm8MirOIfHFRZDBrQC9XH@lists.infradead.org
X-Gm-Message-State: AFuF++nR5NewRFVMuEIFSz7n/7Jxb+VZg42h8QePx/uFjRse2gJFeIKa
	cBIMm3y8Ar4dxUFLaabefdxUugdc3csApHAGhASt1Y1rvcTmU8OOBr+c
X-Gm-Gg: AYBFou0ONwBPQhS7q+Fo6LawgxX+rZNEKtVrSOwV3Jy+10fWuCkAE83OJzOegZd2Rh/
	sTWbKgCPyc/1KPyVOl9Ets1YnfIKAx1cvTEFqlboiuVnLB5PzTXXOiffHKXGLLC7Qr4yLy9Hx30
	nWX686NAbXDi6JUjzhjqvbV2/7eASv5DoX2T6L2KrE24nPElJwG4Juj2zNQqI/XDHZYoiqse/vn
	MLB+tTJTCkNIt94S2/CAAPWnN/AQCit39kUYtC6VTzzYCvMNqg8U/D/dHUyHwG3Q3wX3xafDLeT
	RazzkUiPP/C1Kh2OADQZ6OgakbImcyAMh9mIzQuclfs7clPIYH2I1F1w5l3bOV1QAyyGmXsp4Fl
	wjOrC6cwU4SHHa9ET+9pzuDZU7fgq6Htzb3kHKtKZST8jiJbQRsKaO7g2NS1M6OB40RO16horhL
	HJC5jOOdaSgq3OvhVJVK59t1Nos4k5GqnPNlL3g9y/+oSuK91veAFU0Id07I+ZpGAwhKNfhH189
	FTNrXje8//NlEZ1JXsOanRfc3EpLevUFmhqgNoCDcbaPkxd13dLi0ov5weLVfoWbeSKWn1CAADv
	cLBsOaIVkGAIOuBtM09UsSniOzNmE1Gtd90F
X-Received: by 2002:a05:6a00:288f:b0:890:a995:1f61 with SMTP id d2e1a72fcca58-891b138d421mr4452911b3a.15.1791446768676;
        Thu, 08 Oct 2026 01:06:08 -0700 (PDT)
Received: from cs-107073042055-default.asia-east1-b.c.uac61c9752218803c-tp.internal (191.247.80.34.bc.googleusercontent.com. [34.80.247.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bb49f494sm1276097b3a.34.2026.10.08.01.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:06:08 -0700 (PDT)
From: yang <yg.jiugui@gmail.com>
X-Google-Original-From: yang <ygjiugui@gmail.com>
To: Fuad Tabba <tabba@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Will Deacon <will@kernel.org>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	yang <ygjiugui@gmail.com>
Subject: Re: [PATCH 0/3] irqchip/gic-v3: Lifetime and range fixes in the GICv3 and ITS drivers
Date: Thu,  8 Oct 2026 08:06:03 +0000
Message-ID: <20261008080603.1987-1-ygjiugui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CA+EHjTx-MGu=Rh90WDnTWMS4=8vcOdbhR35g42BtRBy7wqXBXg@mail.gmail.com>
References: <CA+EHjTx-MGu=Rh90WDnTWMS4=8vcOdbhR35g42BtRBy7wqXBXg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_010610_107925_81BC9624 
X-CRM114-Status: UNSURE (   6.39  )
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

Reproduced on /dev/hmv (HarmonyOS KVM). It advertises GITS_TYPER=0x803ff71 (IDBITS=0x1f), which triggers the unsigned-int truncation and causes nvecs to become 0.

Tested-by: yang <ygjiugui@gmail.com>

