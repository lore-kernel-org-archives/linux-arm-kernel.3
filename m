Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0EDCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 07:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I/B3iWz2lj18m4P9RjExUmXdiUYhhvyFBGz6pNiCe5c=; b=QDOAK5Gws1wtOT8xxFuS1E3PgJ
	CMCFKIy51n+ueBbK2zMJny5tnMK0DQ7XwscKOLIq+IJXCe52qKXVNpsVdSnMbpJibmITP7a5dj9aA
	9UL34FGMNDXPlqHqekNTboP016t4KDWfFHTSx40ET9Lt/t6dYBWLf3WSZifh27Z+YKjuZFqmYSFv1
	NrOUCk/6DyckaBnSUon/sb1HNyz5epjwzR8V0euWBs9ryyDhJKezFL4oJSqfWdl71LnJZzoZsSsdy
	2u/2sSHD0NI4qZnIwYD77yQ4S38awvxK8dHF+UzvVgvJQoqBp4lRBFOmFn15FIoOZhQBMXenoSj6H
	hdrZwA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwsK-0000000AI4t-3I3Q;
	Mon, 01 Jun 2026 07:15:52 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwsI-0000000AI4K-26I7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 07:15:51 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf3781ca51so18162515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 00:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780298149; cv=none;
        d=google.com; s=arc-20240605;
        b=HInfV3OXYKv4zD6juH2RpvDM38aJaHmxP9oCh0Mi0VC+y+bfEbNmJhVVNOTG66m2eK
         1+uhtbYI1qjeMeepj1vyqDywCG9V9BkTL23G+WIy9vAWYwylveMMVDHyKIcUVYFawoXi
         NE3PY1vuwfIGk1c+gkV0u8dS2hf+UuktNL6PABc3fJw6E+lPR4CX5oXdy4rDpyjEyHHr
         i6r3Vq3Du2vF4GIliT9M2X9CCsop/KHL7Ngq/wmjy/fdgovNjMJuzlbB5oI9lZJDqIBA
         idWyqrTOjGQyOO8VGclNjDlf3FOe5ghXVEyAIqGAN07kGuXmXuafEAhhsqbIpCXX3Etp
         /1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=I/B3iWz2lj18m4P9RjExUmXdiUYhhvyFBGz6pNiCe5c=;
        fh=ArJA3A2PdnvDQY7KXJ0m2Wt9+hblCEc/Xi0A4IR/CdQ=;
        b=lamKiJduJ9cInh6RKjSnZLfSOaa08DrfGblHPVozNlZi6LkVGpRa4hI8N9H1bECnL+
         IdRdp6At4mdK3WyGOp8CnvFpg2pB8OVKaRABzAaLFlPqdcrIl557QL3qbfrQzpV4EvG1
         eRrEyggF+QB9lhW/5VmW9UlC3jKXV8pW2Rl9tuWEXiqxmhZesxxc110tYipgjK29pycj
         66l6a87cYt8B0M2cnXJFAXbz1wSrQVlw1iuse56PbtsbxDQnAZUDqrm+NgzO5J/gNWgF
         2zkNW+eNGxcUMwog+5Ekw3Stgu/cc0iLIqyxRfDK6X3madRn6FKDfI8GPl0lErk15D1j
         YZtQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780298149; x=1780902949; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/B3iWz2lj18m4P9RjExUmXdiUYhhvyFBGz6pNiCe5c=;
        b=k/qwwqOBiNy811q04GBQQYWJsPCyvd6/QSF2K+T3SIUAbmCWyF74GnrWf9IDdwshyG
         xG3EkPj/gfxbA1DVqrgarD/bzfbx89pbNtylsy9jBZXhOxkujH2qXgwUPaAENLl9hfDw
         /ZbDtToMlgjRu19msPu7LifwynjiUFNNGwHfmDK7IbzJXDD6NtPqHdv31K0bTUUgdEUa
         B3C7PEJ/9KPA7XHpWkW4MVo1RYLb2335iF5mOY0TvrCj2ZFvIhldYwSMSUt+pqWNE/N1
         ZJljizcBDGyun2dISkrNOFKhqptyuvIoYT0xyrlpw03LNiLLAGQ/YqRpA7pU+3XXZAy4
         NNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780298149; x=1780902949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/B3iWz2lj18m4P9RjExUmXdiUYhhvyFBGz6pNiCe5c=;
        b=jr5jFqLCdDXcqi9wWgXEmdjI02mxBZKs0LCL9vTS1CE0ouKTOHAcDXPghla8FloPf/
         tUWqvcI1wjKrzkNEMIDcMDhohv9FMFfHg4eQydq0/NZHnfNda7R9Q+Bz6uVSbFebNjRs
         6ky06w/4Der9R4cayr7rUtIN0/KKRZGzXYde/AiqlIIArnnvWH49XG7BqHIvbCbB8mbg
         4jB43CQAxn4HXVggf0ed26eGw0fLEc5rgRr76FlERuVa/Q49FRq0kWsJ7+O/EB2CC+F/
         RUgUTd6WZHfYzvxR0qxvpIiQ5pcl4iipkDcyfKYXnewSMVmmmHaVP6SfCrCcjMAu4IXB
         uNiA==
X-Forwarded-Encrypted: i=1; AFNElJ/yvLx1Gc72mo8GvcNsur5uOXc2HBVxED8TVXBbZ/qAoPszvu94W28PFb+hww9D7vgHRHKfDJHqtOCFSZXZkenT@lists.infradead.org
X-Gm-Message-State: AOJu0YxK3m04QhTnVDezY3N60LslxEK7R8pIc/I/jABZ/kqY9nNIO5wy
	YCXWShE/BTzZMVVsONpuiUt4Wzop397VHMVxeEWpkNwihkxup9Q5G/Plw0O1mUM6GcHRjy3TZ8a
	eIU+ihuBMBR/U1MhBnInu2WE81FciFbY=
X-Gm-Gg: Acq92OEnbzFu/1pBaP7DFIsfovzgUXqrxbDEm/uzModOa/ps5N1y0EQO42aheHwPpZs
	K3Abiq35Kowzx3CHyWTwYAaNFddQrEdr6xL9jAap92GtBMB2wb4T68N/naVnZFPA1opPYSPdWqI
	I4TAAE4k94CNQ27IdAfYPUNGLF2oF23r3r4LPdCkZHaiJ/xQ0Iiqr+wiy4ywau9RjVKgD9D1ree
	62KtaJrFfJXr9Lw4KLVmktnzsK/VQjOnX0Osh2jKExlA3dOng0fJcetKr2buxjRpC/4WpL22N8x
	rN7dnOYeHkHtpWUnONE=
X-Received: by 2002:a17:902:d48b:b0:2bf:2114:ecbe with SMTP id
 d9443c01a7336-2bf36809f57mr119845635ad.23.1780298149509; Mon, 01 Jun 2026
 00:15:49 -0700 (PDT)
MIME-Version: 1.0
From: Grewstad <dogestad24@gmail.com>
Date: Mon, 1 Jun 2026 12:45:38 +0530
X-Gm-Features: AVHnY4JjQ3sDDnKw9Gxw2BXpaCJJzflQjNMzpqOep-jaxZKghv2hpZ4f9tPu0iw
Message-ID: <CAD03fjb=_kW9=q9YV4qnQ5GD=HMB5Bx7pf3+AFcgDR2gVc1V6Q@mail.gmail.com>
Subject: [RFC] drivers/staging/axis-fifo: Looking for users
To: Greg KH <gregkh@linuxfoundation.org>
Cc: michal.simek@amd.com, radhey.shyam.pandey@amd.com, 
	Andrew Lunn <andrew@lunn.ch>, jic23@kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jacobsfeder@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_001550_543848_746771FF 
X-CRM114-Status: UNSURE (   9.46  )
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
The AXI Stream FIFO driver has been in staging since 2018. I was trying to
understand whether there are real in-tree users of this hardware today, and
what the expected direction for graduating the driver out of staging might =
be.

The only in tree reference to this driver that i found is
drivers/ethernet/xilinx/xilinx_axienet_main.c, which states:

 * TODO:
 *  - Add Axi Fifo support.

From this, it appears AXI Stream FIFO support may be used for some AXI
Ethernet hardware configurations. However, I=E2=80=99m not sure whether the=
re are
any other in-tree users of the AXI Stream FIFO IP besides Ethernet, or
whether Ethernet is the primary intended consumer.

If there are no other in-tree users, it=E2=80=99s unclear whether this driv=
er should
remain a standalone staging driver or be integrated into a specific subsyst=
em
like networking.

Can you let me know if there are any known in-tree users for this driver,
whether it has a large enough user base to justify its existence in
the kernel tree,
and what the hardware's real use cases are?

Thanks,
Arihan Bhor

