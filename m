Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB89CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jm64Gs8i7Q18G/MS8gvYPRujEDuv50d60Vqsk7Bxo+M=; b=GL43bA6/oTikesKdgTnCqi05sp
	cxs6p7ffrz8fKo9CbsBPntKUXu2sayPGuYMGJvN5YoVJqABt5BsTR5PR0WcVwmnHTZpBm74NioHeg
	dgXffISeSleosARA2mTQ9nIEczbSb0BXtDF+bo7mwa5EsrrlFPQdaMMKuMM3mNr5CX7LWW+4sDTo5
	il6aycIGxHqWVtiZ+THDUfNB/MxYNh5i5/VeSTiwcHz/Dz4ERp3bcnbb5s3DmxWzQBQuoMtkXkePP
	nODgZKSxcA8VN4SUc0r3EVtJd2Fq0chsmBh2uDCNSssZn+2cyRpCcLgOWcsRMpfUFQ9FOCNYsWf4Z
	3ZePquIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZj-00000005Yvz-1KRq;
	Sat, 06 Sep 2025 00:14:39 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uug73-00000005Kl4-2L8e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 23:45:02 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f6abcd26bso4222409e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 16:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757115899; x=1757720699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jm64Gs8i7Q18G/MS8gvYPRujEDuv50d60Vqsk7Bxo+M=;
        b=nAO2toag+X+aykxZW+aKP2a+iMmNy+BxZn0iLODQI+rKvu2aISMN1vZF8VyHpWHTAK
         LogRDT7WZDhM3FovhtN6udfCc4J9w1qYLWKtznkErnSnSF77uAJOY/cuvP1HcS+k09So
         PxExsFLLNlOFqCwvkcieXoybDgyofCQmm1DKNZsDzToVw9ySLx7UftQYIrlu6NYesJK3
         Ld9gRvHS89R0AGyl3HDioSXrBtk3dajAzppOE8gglk4PYT6xooKVn9Yw9IYlV8XdfPCA
         ldu4Z3bLqyk5UJzDoYEuFwuRryp0GaUvpkYVuing28nUVC5D1h8QPgtHhXm8JXDYKAib
         AVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757115899; x=1757720699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jm64Gs8i7Q18G/MS8gvYPRujEDuv50d60Vqsk7Bxo+M=;
        b=odOs7MPRzax3qMbg4njPvP6sP4OObO1cOM8m1UdCb5hzJKiXVt06pNUSBxEDLnuHEQ
         aZ8bSqwFsVAtnGChoOviL3iptCHk2b8tVtVxtpivfwgsfI83ZmW9TK/fCa+fwwNKTT7G
         HVKjBaoAqlqthImbx4to4/XfDHspDNU7IvRCdBzSf8Sqs1Nbd/ziAikS/nEsS+PVC1NF
         WfZdq4SsCsf5clBXGpT+oj07lyRkHL9kmtKPugUBtUnBid8EB0iRuaqpYyWcVoMVrFh/
         5qWC+oqhQcsHnW3x7Wsaj3wLHv6DfMjdX02f0phqJchj87TcL8jv8JC0wkpYvy+OskNw
         P7WA==
X-Forwarded-Encrypted: i=1; AJvYcCVEYAHVtINEpZWNrfynrOHQl2fzL32bxK471gwmFNagrsl1uezpG+spGO+TNZ0tBsFSBCn8hBzcvM2ybjMruVHB@lists.infradead.org
X-Gm-Message-State: AOJu0YzAo49a1x4Dg/3pepcH0aPfhVWYnloT4WHUw3DSzMHjZS7lkYyi
	Exp0iyTx+kj1ksL4m6rnwxpWTESQLs5onulOx6Y0JV9FhN/tWFHPFMTNIBVdhIb7JqQ=
X-Gm-Gg: ASbGncst2OBHjEZoTkUXiookY4DCsNLRIMVFnYQ/oIaf/KVSD2afXPUQCCejSmXe9C0
	MiwFJ++j9xCbHtlVq2eZy3qB6kL9ei1+kuDC0kVUcVNFH/gwd+bwLHl4CLT1pEpy3CTF5iCpeoh
	FVIjToUyMMGUiGphnukzk+EUVu25TcUlSWWPYW1z6zknY+2UJ1Yzc29cKCKjLDMNOrerqnh/ONc
	YJ5yPZzRHtrZHpdW1E3/zP9+3gzJK8GL6YV9KZXb0HfrXd0pMdJU8HAkIO6I4/sf5+Dc16Gnf1H
	Q/fZ2IHtPggQu9M6bIL4dBFZd1EAVUTIYgQvBYvZ8MhxFHaBBVBAFGkfwRnlSm8N3HeG3hlnGIA
	a7TJBlDrEfoRBKZGO6SsWn56OyCoka6MIbTzQQvIJXV/BPDnZTUQ=
X-Google-Smtp-Source: AGHT+IEy2HVJRwuLhOsABFo1qDBfSM/TKVDGjg8IAHoxKlc+T8NPkxVoGiBJwUzPv/hKdp9pNUXsrA==
X-Received: by 2002:ac2:57c7:0:b0:55f:5c1d:6cc4 with SMTP id 2adb3069b0e04-560995d6aaamr1172200e87.20.1757115898906;
        Fri, 05 Sep 2025 16:44:58 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([88.201.206.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad4dec5sm2046765e87.140.2025.09.05.16.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 16:44:58 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
To: sudeep.holla@arm.com
Cc: arm-scmi@vger.kernel.org,
	artyom.shimko@gmail.com,
	cristian.marussi@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: arm_scmi: add missing spinlock documentation
Date: Sat,  6 Sep 2025 02:44:58 +0300
Message-ID: <20250905234458.3788783-1-artyom.shimko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902-daft-pompous-angelfish-459c6e@sudeepholla>
References: <20250902-daft-pompous-angelfish-459c6e@sudeepholla>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_164501_600634_48CC525D 
X-CRM114-Status: UNSURE (   7.43  )
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

Hi Sudeep,

Thank you for the review and your feedback on my SCMI patch!
I really appreciate you taking the time to look at it.

Best regards,
Artem Shimko

