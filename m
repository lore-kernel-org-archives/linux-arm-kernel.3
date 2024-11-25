Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13ACD3B7DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 07:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Date:Subject:To:Message-ID:From:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5vcp0J7zk08bcGnG6ixoY9FJh5UMVRDDbvoFP3uqAdc=; b=Y1ClpQ2ojIU5DzpoicgLmuoY2a
	pdZWxrEVaDPBatJr2QOLWBnh0GSrBu5a9rfOgYJBzH3IG4oH9FIAts0yucImnjyKChXWSoxezawQk
	wWY0FMNzkLmOQ2JMu5oRmAwT6vyHYJPe9bZtbG17IYCXe0CwAXscxVREYOElCIo2wrAEx6bhZsguJ
	0RHeW7Jea2Rz2xUhu8P7rM9ehNqzi/hAGAsIvTTrp4Vrb4CXndTwYLZL7BzxWVHWaDF1Hho14cwjC
	LVEJyblt28AuprjLnmMaiDBxmcFSUJotTxdrthSj2Q3+2CTgHFZVD4UFxaiIihCTqIoVm0n6BW4AX
	iDTwlFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFTBX-00000007DTh-1rVv;
	Mon, 25 Nov 2024 07:07:03 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFTAZ-00000007DPo-3yYK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 07:06:05 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3ea36b05654so425906b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 23:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732518362; x=1733123162; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vcp0J7zk08bcGnG6ixoY9FJh5UMVRDDbvoFP3uqAdc=;
        b=bBZ/zoyJgS1sntCB95GroxnfjoGgkz/V0ZxHIKPlxw5hVK3R8PRO1I/lPZsmXpqnfN
         tNHWsNGJziblggXgPvq6ZAyK4dqF4DYwmM2XnyLovvnhJYijwYUDMiUdDC7koJixqmZP
         7VyQcoGI5jaDX/s8CWgjmxDTrvNQnTN7z1dqHE2OaPqGWUFRshSxnGJJ7Sm2lzrbba//
         AowYX+vNpwAHB42GJVgiw3ztns3kjfefOuJFnHl1his1dBx88XvGgTnbVTWqS4gqimxi
         el5U1wH3tIIGBLfgFwn7U/I1Wwm/ZgH4QH1OX3FpJdPNw/bRAK37LaNvIADBPlNZNKGu
         18DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732518362; x=1733123162;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vcp0J7zk08bcGnG6ixoY9FJh5UMVRDDbvoFP3uqAdc=;
        b=P6yqsuvAh6G4AsVwLztGKdK5Wvcz3bcsjUMw/Vz4WmNW6HWC8C2IlvqIVv9/L4Dp3w
         H7H7QyqNZCkJJqii27b0wDv8mJtVM2o4Ji/pYpLYzoeIAdzPlIoPw1KIwz/BLUYtStfK
         eLwgYEiPzM1SZ9XhUXZItGqVE6BsgjXssnYkfD/0GDKn40Aq6qK7ksJ9HbP/6E7VFmBC
         ZD8bS7gcWuEACY57SiMr+GMFlNENUqYY9apEereqwFjCzuiG2ki9sJP1SJ2DJKNzjlce
         1PhEIHh+S9aUUThW1Z/mqiP3scRntXfki8j7l4LlgLbL7F9qpahbZgpbXO+CDDXoilYK
         Is4w==
X-Gm-Message-State: AOJu0YxKh40bk2Nc32oCmZDfw743X56WkQpQOCkEGlw5yd631jg78zD2
	X54rxw/nNIn+8bkfxt0aSeQ+9UDeUYZp3wAePRPI7I4GbaKJd+9eqLu0vw==
X-Gm-Gg: ASbGncti7he0hUP7g5L4g8k8NN1tRVJGTwninUNiBjTYZMX+NUsW6M+qHqlZ2nKPlQp
	ixDBqNM0x2fbDdbftr1QkmF9dzhq60uGXZxmS8R7xZAlTHtJC0ZxH/A21nu+fK4iQIVRJ6Fz3XI
	o82dzDBCFVYdPblakTMGAXLRtesghdBvWGohuoxk9z9Rm/I+3Dq3kaTaU3X2Xx8CmRJtb6LHGVN
	P5Vn2xGmDW+Ow5qG2CK2vj5r0quy3Bp3eB97lu6klAFpH+hay9rEhZFZnwiOmcE1w==
X-Google-Smtp-Source: AGHT+IH8SLYasaOgS7VrPtLKLu1FilLYF3OzKoR3QMz/DEfink9nDULLPZA2l8j8sSqJ2VBXVhlf+A==
X-Received: by 2002:a05:6808:13c4:b0:3e9:14fe:2b35 with SMTP id 5614622812f47-3e915a58bb6mr9580040b6e.30.1732518362451;
        Sun, 24 Nov 2024 23:06:02 -0800 (PST)
Received: from [103.237.87.171] ([103.237.87.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724dfef5770sm5554388b3a.56.2024.11.24.23.06.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Nov 2024 23:06:02 -0800 (PST)
From: Teri Olson <htactor160@gmail.com>
X-Google-Original-From: Teri Olson <terrolson@hotmail.com>
Message-ID: <f018a33ca77d46e14b0016492df7e0a0ac410f75c4d661fe6d074ccc02283b4d@mx.google.com>
To: linux-arm-kernel@lists.infradead.org
Subject: ` Piano `
Date: Mon, 25 Nov 2024 14:06:01 +0700
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_230603_976906_95B40BEF 
X-CRM114-Status: UNSURE (   3.34  )
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
Reply-To: terrolson22@outlook.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

I'm giving out my late husband's Yamaha Baby Grand Piano for free to any passionate instrument lover. kindly let me know if you want it or have someone else who wants it.

Thanks,
Teri

