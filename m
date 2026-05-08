Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37483CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 19:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Cc:Date:Message-Id:
	Subject:Mime-Version:Content-Transfer-Encoding:Content-Type:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FBvpAEZMyf6KAW0FZ8+arbkw6G0iVCl9h8X++Dsym24=; b=0yHLJTbrDTHTeamT0HLdcc87Gm
	2E2fyrJJRqr8TROXMQWt3Q0Y/IggwJW+S8wiD7UHorpJ8tOt3HWIaf3ZqVRqRYbzU/BHKXV9Y2Y6P
	D9M1uLWWCErNBVr33tslP92QWz6bjuYchUH4oH3fgpZbfvOm2W/MrQSaV7Ve/9SZMI715Jxopn1r+
	1LlEtbKq4y/0Fpoh3V9iwH51c1Y89VaImNeL7+QZ9tyntJvJrA/w/d/eLlWpcoMT0ADUrobbjtxLA
	uFF0OCWSAqBXNq/o1yw5dK+/uk5bN6rYJn/XdpqcElPCh+aUeDEkKKF6Buy+s/Nqzh+Je5kFoyrmr
	sat7SY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRBZ-00000007Obt-38zg;
	Fri, 08 May 2026 19:48:33 +0000
Received: from p-east2-cluster4-host9-snip4-4.eps.apple.com ([57.103.78.215] helo=outbound.st.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRBW-00000007ObJ-3lEa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 19:48:32 +0000
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPS id DFA9E180033E;
	Fri, 08 May 2026 19:48:26 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQBOHV8DWRxBAEkdXAJZEhVdRVkMVAByGlgbWABWH0YYXFZEHhcNVk1TGVAGdwFTE1IVUhlDA1deTgsTH1RWBFBRHV8CCgRHBFsXRgNTRUEEFxFQAVgeVl5aF15NRx9ATWJJAVoZWxxAF0puTVMPDxpYG1gAVh9GGFxWRB4XBlsUBEQHW3ZZAjYBQR4oBVsKXQ1IClwaU3BGfFVxWHRYCjJ/QAEvA1lyGlgbWABWH0YYXFZEHglLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jackmatthe.ws; s=sig1; t=1778269710; x=1780861710; bh=FBvpAEZMyf6KAW0FZ8+arbkw6G0iVCl9h8X++Dsym24=; h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme; b=eNcsieeABmpQUM8GgihjGZDprv7OCoAnJpW5sYYv6KLHZFzh11g7NO94mycfS5v0ycTEz5Za8Paeirq4uAKPAylYZyTw+aEZNse+7GFQapqJxUYOdNz0ZelpT0OyzCaXlOStK5lXUOyU1vqK7+UQTpkG84KIu+HazAwOWfTXNs4XDBi+I/oV7R3lXRp43cjfwpx2MrgRd9YDsBGj2parM7u9swiKhGEa8VEnLaEXQiDC+fc47m5shmZNS3XvhgHhDm5k/WQ+hf56qUhnVaoKFYt+jwjDn7lQYVAb5gVeoPxAn6wtzXZm5ejXtfOErZ6c+pASIU4HneJan2NPjEig1A==
mail-alias-created-date: 1756088113082
Received: from smtpclient.apple (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPSA id 96F5218006D5;
	Fri, 08 May 2026 19:48:25 +0000 (UTC)
From: Jack Matthews <jack@jackmatthe.ws>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Regression in split ARM MMIO timer driver
Message-Id: <46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws>
Date: Fri, 8 May 2026 15:48:14 -0400
Cc: linux-arm-kernel@lists.infradead.org,
 regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5NiBTYWx0ZWRfX1cSdufuGzJGk
 MsMfGVzylnzT3W9mXQO0C6c+96va1ZMnU3x50t2Ps4UGj+2ueM8fjwcz19LEkKbdR/Co0Lsk2zU
 zR8ye8kDHbB6zaGKj7yrBoPQYCNJ+LsQ010z6FlpFGhLJ31G7pkZj+/eD/iXH4M8WO9M8GvBYHS
 uT4QgSanR8H+Sd1FCYOaLugIirNtWWgUrXckpnoYX/Okh4ozZK2ivU3m/QWvyP9OwUUwBpPUcj6
 eyo+fofExIQ45itVYBVy6JRcb7S61DRtD50296kg7zPdA6oz845nOR6F1N9bqHPzmjGg4c94Lry
 3S9NC9hR6Wj+KuPkB5y/WAmKMZVQYjqMO0vyzZKc0VtGWEv6L1d4VtimnAjI68=
X-Proofpoint-GUID: MGjV3gISKmJDCMzW_07TH-QR8qCxeuOB
X-Authority-Info-Out: v=2.4 cv=LKNrgZW9 c=1 sm=1 tr=0 ts=69fe3e0b
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=KQRe4iotet5z0gzynocA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: MGjV3gISKmJDCMzW_07TH-QR8qCxeuOB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_124831_013023_1E474B6D 
X-CRM114-Status: UNSURE (   8.93  )
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

Hello,

I am working on mainlining an old chip, Qualcomm's MDM9625 modem.=20
I had previously booted 6.17-rc3 before putting this project to the =
side, but when I restarted work on 7.0 I was unable to boot.=20
I have bisected this to commit 0f67b56d84b4c49adfd61f19f81f84ec613ab51a =
(https://lore.kernel.org/all/20250814154622.10193-4-maz@kernel.org/) and =
reverting this commit makes the device boot successfully. Unfortunately =
I do not have access to low level debugging such as UART so I have not =
been able to pinpoint exactly what is missing.
My changes for this chip are all available here in case it is an issue =
of my own doing: =
https://github.com/jackmthws/linux/commits/mdm9625-latest/
I apologize if I this isn't the proper way to submit a regression =
report, this is my first time doing so.

Thanks, Jack=

