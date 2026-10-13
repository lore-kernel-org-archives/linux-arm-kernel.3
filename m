Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6E9CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 04:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQcAD1MMEpo3eZQ8woRePVMMduZ074A3ZIDLuK3z6ek=; b=dkA01TE9sAOz1mC/m7HAAm2NGL
	OLWHDjFLj0z1fiLDyL6pwyyhCUt1o6w/5Cw/Zimc7Lwqa4QujGZS5kNWh+CwKdPyDxKUIqvJeEMCK
	QUQ7KwEZ6sNvfugpMcWlKlUbs1JwY7NDYaOno5BSCuTnCcaCFMxU3RnA9URlC1/rjoQ03WxR8zURC
	b1JKiYQIfYirK7H1VAlSdhhuS83QAb7rYcIKsKpvez08fDHRyzWa+V1+dzt2Re4aMysxzOMmXvb9r
	/GKyDvnwFSSM7AjoKKT2cHYtcC8VhLlukReUvPNGf6LDQZXgNgphiqN9B7sniLidMCc+44MYNhjuX
	PSOLFElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGUY7-0000000BzRw-3qTB;
	Tue, 13 Oct 2026 04:55:39 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGUXu-0000000BzRV-0iK3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 04:55:32 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-3514b90bb89so4802803eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 21:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791867325; x=1792472125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQcAD1MMEpo3eZQ8woRePVMMduZ074A3ZIDLuK3z6ek=;
        b=ECRC0b/vLGutwGEEPBU+SUoeU7qoWqv5NAEdV0uISxCvEMz8LAeDEylffb94kZBS45
         lZWv36yOP3BQRtiHC+7MpgmvVYxvhPDrT62dpLhtKy6lyiSXHooqvz/bDZiSFUa9eEB3
         11Z8gvriyrJSxIVcqfqeqQsVrOjUe28ZgerxharJ/7HaiwpG9UW0o7Rg/IdlSgGujGv3
         Q0QB9GM2T94Vj0h50nlJAYBuYe6khvfs+59lZsvDQNaO2WyCl69p8Y9I69B2uMoWreS4
         Jahxuka1uZd4N+GSKDQSNdM1AUvcEKAf70kOprIdwfXdumV2A2YgFzOzgAYIBQXta4PS
         9V1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791867325; x=1792472125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQcAD1MMEpo3eZQ8woRePVMMduZ074A3ZIDLuK3z6ek=;
        b=SA9otRkaaNMZFeWn1aERxj892rKOjX619VggcTuxTD/5N1K1TrGCYtlgaz/6lXb3lM
         1ZTHxJzWqXqTHVyWgyIO4fK2GV0GaimjnygavlgeP/NFRlYIc3XkcGdLVSV5BnUVbn/R
         BcyqkOHxakaNPcdmRmdGaRGVjntqihM9d+h9m/dKTKDqb5qYl/ptJW4mz9KHNL3b4vvO
         W9jQ0uhoMS0vlAdMEKTfc/GDfmaSR5pL9IXpbLz9F8Irxq7D37Tvd0jFOde1GydfBccB
         9Swl9yxflC11gR7Ar5VfPAbPs2X6QS1kg0Jn563rzSy5B+RnsFV3xDVaVH007T/hzr1v
         dmkA==
X-Forwarded-Encrypted: i=1; AKwUvByOO1lUpPHtl0HV4qoVcNCAdm30IxyrvaA4/L+dG9X6LJnaEkUeX7lxvchOsmlNlRK4rq1EocXdfkQuiZwuaf3S@lists.infradead.org
X-Gm-Message-State: AFq9FYIo16v9G5aKYDnYjCgYTme8ZWsu2unQhOv2Oc3dK9hlMHwQf9Un
	nf8laEvunlhP0XOhxdeRlQ/OtSUbg2srreHLKraFD3UQb4QKF9PrwUT/
X-Gm-Gg: AYBFou25fuIUtDzbyENwRzScJXQcoi7L8nMFzXnH8VUjmeKQlCDfeF0TgvYe8NFUtuT
	YffkFraH1y3mFx4SGr/S7n9xE3y77tr9wfQbdr9iUT7ZAuDMTXt8noyg+nyydENiInCfa+ulDD/
	ztM9iyFOKRASL5wxq0CmMKHI3PjH4uZ33Q8v6ibXuSUY83RMYMoA3Rmk2SStBf+f+2mIxrRg5P/
	5BYQDuwcHLp53EgkNiYZ846dmKh6NzXKSU3zvIGjMob0gENwelAKX/lNBaYXXURPyVPgvj82zPK
	32In0Bqg4P7vC/YzNtELMF+vh+B2CBAOHkwkXGE0AGD76jfo4xcL8QRXTOe2yELPSUObzihHTkt
	v83KPmMnytvIMU4k7UWWPlPnajQA+ZBRsfnjPdCwxVFAePtfW4Q7khunp9BZXqbwHhCLfc/jAL5
	OpHJHWrztmUUpSypOnMorW28g2rI+yGhFcraf1R3g9tBd8HI57P5cCQdmqg3Y8X60mH0ao8xzvV
	sgQG8zRniJI
X-Received: by 2002:a05:693c:88c8:20b0:358:f678:46b6 with SMTP id 5a478bee46e88-358f6786227mr11214375eec.22.1791867325040;
        Mon, 12 Oct 2026 21:55:25 -0700 (PDT)
Received: from online.mioffice.cn ([2408:8607:1b00:8:5e2a:b6c:f432:a6f3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm38832952eec.30.2026.10.12.21.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:55:24 -0700 (PDT)
From: Pengfei Zhang <zhangfeionline@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
	Jose Abreu <joabreu@synopsys.com>,
	EricChan <chenchuangyu@xiaomi.com>,
	Simon Horman <horms@kernel.org>,
	zhangpengfei16@xiaomi.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: xgmac: do not treat TBU as a TX event
Date: Tue, 13 Oct 2026 12:55:10 +0800
Message-ID: <20261013045510.2746341-1-zhangfeionline@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261013024747.2688984-1-zhangfeionline@gmail.com>
References: <20261013024747.2688984-1-zhangfeionline@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_215531_614741_AB738BF2 
X-CRM114-Status: UNSURE (   6.95  )
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

+Cc Jose Abreu, the author of the commit in Fixes:. I used an outdated
address for him in the original posting, sorry.

