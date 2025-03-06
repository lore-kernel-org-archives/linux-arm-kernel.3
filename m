Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BECC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LF7oF/vPY4sjxZRfSGkbpkJkGWRlWaUOeLFBkhithM=; b=feFS4od0qYKuIvhQdGMRN2QxKs
	pOfIKl3YxVwKoiXsedtafttjmjaDBDXXmLTuP1u3KSb7Q1uB0KKlFV6qw20O7uGrYoW5BWu6XvdnH
	FXICyjIF1B7imjoXz2t36lEEcv5ZeIkl0b4uNa+3Jo4g9iEEEwR7Ai9FN4Un02pfalzxfJ6oukjSU
	+CkT0PL5mOeQ9of1uIZgAyV2LTIPPK3WWSmVo67E/nuvYany5jsiV+FExnLKkKfTAnsP5IAMN2Bef
	5oO6gFt7i561G6KsG5gWNFRtfEDpSzcxSvkzJCOj+5lpYxJhyrZwwwaac7PJWyJEDbBtSAlE82HXG
	i/DCE2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqClS-0000000BGoZ-3rYZ;
	Thu, 06 Mar 2025 15:03:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBXx-0000000B5xL-3qgM;
	Thu, 06 Mar 2025 13:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4LF7oF/vPY4sjxZRfSGkbpkJkGWRlWaUOeLFBkhithM=; b=lQ5yUJyMc5QOcQskqktmEkz34U
	DLqaDP83oB/bbVcgUmv8cTW5aqLT27275Q8CKuHVaH8OiSnnkU3jD/2ve7p1/taV0RybrQNwu9DI+
	DRVtkiLXVzs0JRAACGTUVbkZ6GNepE4SsZrloZMIVmpY+1tHKO2aU6Gh+19o0itQ+rGyx5FljCM7p
	6XHD9DWn0ybc0DUzoCYdLA57DLQc0jvt/3SGx9vJL+wsb813hSa2bBHletwWl5hh41ZvaD/XnJusH
	wTDR10FnWO5u/LZizyS/8T+ELa3TnDBgYlPpEITRylq5fE/DyPcKqvAeulZpS3XbukAm+qFyrBaIM
	/gOdhZeg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBXv-000000016YX-08Vb;
	Thu, 06 Mar 2025 13:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4LF7oF/vPY4sjxZRfSGkbpkJkGWRlWaUOeLFBkhithM=; b=Nopt0ve+Jk3Xa6M4wqTO4zsWoC
	nLChYlD+UHvbIEYJR9lk4u1rHHxfleX5fJtkFIPtd8CDLHCDg1Byxu5o+Poit54/xtLXV9Ah7accO
	QqguKAzwgHSs7DVGhAm5nRI+gYb3/nDCxqnvESz7vmnbdq2zBSyiTN1zNPdk+w8vNgZA+jXJLRNDg
	n4vwAPXgZP340Pb8qDR8UrE+onQVamuopFPVXkfsJJ7oI9qFAKGEoZ5Gn0SnQAPDO8exE7EZns7jH
	J7UaWIyWKg/UEoqYyAS25qFN11b6DP1f+ndFjVIXOcHcBDfYBT4DPQXcmGTdYKQneGaJHeGgp9kg8
	RfyCOeow==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqBXn-0003Tn-Pu; Thu, 06 Mar 2025 14:45:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Patrick Wildt <patrick@blueri.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: rockchip: Add MNT Reform 2 (RCORE)
Date: Thu,  6 Mar 2025 14:45:45 +0100
Message-ID: <174126874161.670332.12638948694058332407.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <Z8S5SHqUqKYiT6Wd@windev.fritz.box>
References: <Z8S5SHqUqKYiT6Wd@windev.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_134555_293703_5397A45A 
X-CRM114-Status: UNSURE (   7.45  )
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


On Sun, 02 Mar 2025 21:02:16 +0100, Patrick Wildt wrote:
> Document board compatible bindings for the MNT Reform 2 with it's RCORE
> SoM, which is based on Firefly's iCore-3588Q.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add MNT Reform 2 (RCORE)
      commit: 3bf4fc44c6544f994237d8475bf56548a62011f5
[2/2] arm64: dts: rockchip: add MNT Reform 2
      commit: 5324af2d029d47a39ce22ae1613e2753e5e372a2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

