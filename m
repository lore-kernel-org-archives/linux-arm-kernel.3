Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D99C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MI3xhS9GS2tTohqa0CAozCWCbtZPg+ltklfeiJnzIyU=; b=vHA8gYXVyzOugNyxrGyhTOAlHH
	X57iWrwzsG3/FuNvOJpoUnGZxGBIvy/8c+qxeNpJBmWj88JZwf0DT+UzMqPC3xI2cDxczVYfmnKyL
	C4ZH0qYo1d1q2yzfn0mVaai5XwLfYrwlKP7z7uc4JibyLVy+dPq1Wsu/XixTdpkTfaH4/OvpQCMQG
	MPJkDaL+JnJ/sL+qbwhCjd4DVfLCPMHxr9ZtvbqWMRWJjO0lIHGQnaD6KX34yKlPPbXf96uO0RHx+
	Fh8NWaf7sGpHxpQXZTqzTml/GsaAJp12qbjR1dxolso2sO8Q/mxbV0dUHy4CQVolzXpMDBSiNI6mJ
	6AmtTkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9zU-00000007Yvb-2skd;
	Sun, 11 May 2025 16:57:28 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9iC-00000007WuN-21Xk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 16:39:37 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-736c277331eso4086110b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746981575; x=1747586375; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MI3xhS9GS2tTohqa0CAozCWCbtZPg+ltklfeiJnzIyU=;
        b=iGEbaHkL4wP3qKsGf9suZl+N2L/DBflzUqRTyzv3SgzoqIZAX3myRkMqW/xY80cuo7
         8QWeQcNPywQS5iaaUB226U0wBjBnhEo9YFBljxLicwMOl+3erIE1sffA8brSS1nrp/S2
         lgZhvqAcR0yVKRqK+Mh6FVAnpviiYs4TrXVxAgvcoFS6cfg/buwVW/5sKmzV+90DOOnZ
         hHWo3WlRzf/0ZQES/85cJRpbw3K4poeURG3oopPOpJuiExmfILQL4BmT7zHdRte+yj2b
         Wg7IBPSJeC9LqQZkRjMVHARtFJHpmWu1/5wCivDZrWYkoZhtu1vVMPdXPsyaM2j8A+C2
         l1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746981575; x=1747586375;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MI3xhS9GS2tTohqa0CAozCWCbtZPg+ltklfeiJnzIyU=;
        b=SxN5yCUiPM/wnXs5t5qM1He4A5Zd5L85y38UCxW03y4hzXC3aoSvoUYJncFxnwgY0Z
         qp4IMdQXsoKMrCEcgBWcgDJgi2aqxr0/xR5zoFduw09/w/rDSNc9TBhpW6b8psmOEOU7
         No8R7MKSpQuik4dJCfRrWFHFYfb++3r6gLlz/shj0DdobFkGn63pdlqW4E84UQU7v5uk
         +aYrqpP33rS+G5NfV5liNFY3NjNZziqTCIW6WjorRxfQUfYWwYaHTTRTsnSWOwKfb0zr
         53C8ktSZITBFeM/TU3SmDaPR9abNlSelKd+buqmhn/EPmRSKhdoWysQpMAckEU+Bq2Hp
         EgUA==
X-Forwarded-Encrypted: i=1; AJvYcCXRUqRHujU/6hoJNYFKqRFSHARXmh6oD/n6D78SkfwjgG+UuwFeGglSUWM4fbKrzlzt2bJ1Aqw1tradDvYRQVKD@lists.infradead.org
X-Gm-Message-State: AOJu0YyjpnRyoiuS3lFJnFTD4bCfUghxmqLJxbMIMhrD7LKRLEHbDYhZ
	WfCNId6bn2AfuKKu9K8wjv+Lp2ugmfaLfrljlIK5uD5kSuVMhhhpgWN4wgdTY+tsB8Q7bbO1Xo3
	5hS91pFUp
X-Gm-Gg: ASbGncsn2AD5JNrz1wb1jMflZLeCgRjAkShMD4eIPXsBtMnlTxG3v7vSW7CEo0DBuLT
	6bC31yD19bwRUnL4sbzkg3sYzqfkSRSN7jIKYUuJgUMgtL9tekj2xiYJf28keOZZBwtuy9kJ1nD
	8Mp5pcQ1KWpR3Mv83g6oHoRnrMj0moPPnyAxh3RLg+dY493eLmPcc855C6I98BV9DFFXroKHdGO
	4c2Wp04IbDs7RwBjdJhh0W47RXRFs6gcklq3PUJQNTIl6hPAEmvL++cedwDHTBGM5wogrXL+yD9
	Cne2y431i4y9gXvj9lOCb3ShYbgYe9wmUzdLE4WHRcNJG2Y9pg==
X-Google-Smtp-Source: AGHT+IGLUaG3Kp3A5MVdotDg8riD1h1SCHLByx+6hUPHW+1j7xd73QRVyp0W55nwlfqH9cNKJFtzkA==
X-Received: by 2002:a05:6a20:d80a:b0:1f0:e2d0:fb65 with SMTP id adf61e73a8af0-215ab4ab9fbmr15814197637.2.1746981575693;
        Sun, 11 May 2025 09:39:35 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a8efa2sm4621595b3a.165.2025.05.11.09.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 09:39:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] OMAP driver updates for v6.16
Date: Sun, 11 May 2025 09:39:34 -0700
Message-ID: <7h5xi7rtix.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_093936_518903_837EC437 
X-CRM114-Status: UNSURE (   5.40  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.16/drivers-signed

for you to fetch changes up to 36305857b1ead8f6ca033a913162ebc09bee0b43:

  Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first" (2025-04-10 17:35:50 -0700)

----------------------------------------------------------------
OMAP driver updates for v6.16

----------------------------------------------------------------
Alexander Sverdlin (1):
      Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first"

 drivers/bus/ti-sysc.c | 49 -------------------------------------------------
 1 file changed, 49 deletions(-)

