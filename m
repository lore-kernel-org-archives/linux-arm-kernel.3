Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D03C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 18:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xt+rrywOZe1K7faJK05oG26s0MPfO6rH8IpO8iFtn9g=; b=lQHR1IJiAo9FhM
	kiPcDX3fv0nBDpKImUFIYsfdiyoCWCLmuasgA/UlDzz5XtK5RQq2xmNplumAwdV1ZgOygqPEFaxPN
	wKSRaC7mCSo9egqnTwRPSUTyxYF8xPdAfdBOg4dWsDFjvH/IAoywVVf7r/dbvHuyQ+ZI1clGX+zR8
	SUzNYlaaSjQcC8PgW3QGDVSGdolB9d3t09VORVVlR9pbGh37V7OqWyVyMDBLFDgfNLpphHMIrFjUw
	5o6Y286a6rhohLLXJfl4hw3wEKeQV6XmJZ6lN7cRJXUPrSKF9maEwMOVnc6rpvUgrJoZo/ec1vv7s
	kvpC3uTCga57dwiIS/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHS53-0000000DrT9-0p6I;
	Tue, 20 May 2025 18:52:49 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHS2s-0000000Dr8C-3UsE;
	Tue, 20 May 2025 18:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1747767026; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eHu2J4PaPD2w25JBiwNwKEsKhYsJ45o9UOB4EqCKIpibP7MjyFSMpL7rb9LZnkyEubGWTt9Yx2XLEanBgMiUQFPuAMCpxyiYzsqAvkLlO8hhvrVGWfeokPvFuMCVMsxno6fHem+OFuyansOaZMmEoI2TpU3vDH7hRoubERTEJLg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747767026; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xt+rrywOZe1K7faJK05oG26s0MPfO6rH8IpO8iFtn9g=; 
	b=cfsYRfGkYGoHMKQ5HIjBIElExks1RplnPi++uiZv1r/k88Gr5G4NmhA6erXkUzCCuODCE6W2MjWC99BAzptY4sSVnQBiLz+oF0Fh7I+UKF20gBYzymz73MoeUFeY2AiFKPVQ3cMqTSTAyZqLM2xu0rIje4F842cOc8h832PhRrU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747767026;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=Xt+rrywOZe1K7faJK05oG26s0MPfO6rH8IpO8iFtn9g=;
	b=Whd973AcSD5HhW7fN2N1pe54wwBxWwpNoNezVwaMoIUUI8OWW7xfzZLboiykFygN
	R0WNhzXtr+cj2v3zbhSE4Yijk7MnLn5YSr5vpjz2LfYWjdQ+3mRqkhbM7KtSzSW4bF+
	4ZfMlvIVwRrNrK0hg4m+xz/VFojsRGqllF2AgQXI=
Received: by mx.zohomail.com with SMTPS id 1747767025843367.77627410500713;
	Tue, 20 May 2025 11:50:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v2 0/4] Add RADXA ROCK 5T support
Date: Tue, 20 May 2025 20:50:07 +0200
Message-Id: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/OLGgC/22OQQ6CMBBFr0Jm7Zi2WgiuvIdhUdqpNALVthIM4
 e5W2Lp8k7z3Z4FIwVGES7FAoMlF58cM4lCA7tR4J3QmMwgmJJOsRmUMBq8fMqE1JGtRGTqVLWT
 hGci6eYvdmp0Dvd65mfYjtCoSaj8MLl2KkeaEe5eX8BM6F5MPn+2ZiW/Gv92JI0NtLTdUnUmTu
 Wrf96r1QR1zHJp1Xb8HWI6M2QAAAA==
X-Change-ID: 20250509-add-rock5t-fde5927de36b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_115034_948168_8BD558B5 
X-CRM114-Status: GOOD (  10.00  )
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

The ROCK 5T is quite similar to the ROCK 5B+ and the ROCK 5B, so to
share as much DT boilerplate between them as we can, this series
reorganises things a bit and then adds the ROCK 5T .dts.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v2:
- Split up "reorganise common rock5* nodes" into two patches, where the
  first simply renamed the file and changes the includes, and the second
  moves B/+ nodes out of the shared include into a common B/+ include,
  to address Sebastian Reichel's review.
- Rebase onto next-20250516
- Drop anything relating to the USB-C patch that wasn't picked
- Link to v1: https://lore.kernel.org/r/20250509-add-rock5t-v1-0-cff1de74eced@collabora.com

---
Nicolas Frattaroli (4):
      dt-bindings: arm: rockchip: add RADXA ROCK 5T
      arm64: dts: rockchip: rename rk3588-rock-5b.dtsi
      arm64: dts: rockchip: move common ROCK 5B/+ nodes into own tree
      arm64: dts: rockchip: add ROCK 5T device tree

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 878 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 875 +-------------------
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    | 105 +++
 5 files changed, 997 insertions(+), 867 deletions(-)
---
base-commit: 8e7386987569f6c99e6dc86d939476350049b9fd
change-id: 20250509-add-rock5t-fde5927de36b

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


