Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C85C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 16:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GLAaex3QQgUjCpA9kRe8nW46UQTwAcatWWDh0CRYn3w=; b=EwirDsMhmNYZV9RxU/1SSfix+S
	k8S4aouee2DBejecyZSPbHBE1Nvi+D65FF0rh9gSimr99XLt9/owtwCQ+udipuvuw5TBNgM229/cb
	Ry4+Mv8DJlAXAfykPTz6NuOugfiKs8VuReSVmjxyMyPEOQ31OT1P67+YDh5H2jfmkrmIrddgYrBin
	UoAlDLdet82rJmmIm70JUoRQoJ7ZUhW7IqwL0IpLOLwh2riwszXFmWlBRWeMT+dt6JRm/pI0qt+HM
	naTt432wP/c9LYiqB70c+/JA+Yu5DyGEPiLO6n2dETS68PMpC7Pb0O3xZTHplcnVYgFy7vDp0Tm4x
	ABNyMurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FoZ-00000005BMf-48Y3;
	Sun, 06 Sep 2026 16:33:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FoY-00000005BML-3gah
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 16:33:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DABA408DB;
	Sun,  6 Sep 2026 16:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21066C2BCB8;
	Sun,  6 Sep 2026 16:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788712434;
	bh=bIh50GL4CnZVQ1HBuupaDiQHAlo2u2EqwjHC3A4x8NM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=djpP9bq0UrsQj8WzLDwjndxMhBVoAzUuUGQ5DPp5r3x8tH9SKunmAx8YpyhHv8DnY
	 lcXzNdkLsENX6eUBTG4V6baXCdbHtaK90lFmRPH7LiLYmnXU0fk29BAaGT7MLy1Fiq
	 B6/plqWkPgBmjbmN8xfIWV/tBpYUd/CdaTbcGxfwgZ3aT2A1dKkHWf4l4lzQfRt6kU
	 uJS2QsB/AORjHGnoxLKKCDsiR9y9PeBql8M522Q7i2380JZfKSFf7rvCpztH1vXpAN
	 AKyuKFtcqhFPjHnjdouEc5AmCldarQYAQ/AjBGk4SZDBTVBlq95gB62UYJDruas1gv
	 lXsc4ZuxkXRbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF472C79F9F;
	Sun,  6 Sep 2026 16:33:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v6 0/3] Input: support for STM FTS5
Date: Sun, 06 Sep 2026 18:33:48 +0200
Message-Id: <20260906-stmfts5-v6-0-50fbf6af8718@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MS04DMRBF0a1EHmNUVf4zYh+IQftHPCCJ2q1WI
 Oq9UwkSThg+u869iF7mVrp42V3EXNbW2/HAwz7tRNpPh48iW+YtCMgCoZZ9+axLNzJqpxBrzE6
 R4OvTXGo730pv77z3rS/H+esWXvH6+ttQgH+NFSVIoqSNj2FK1r+2c1ue07e4Fla6U2iGIlYOY
 vKqlGACPio1lAY1lGJl8uSsTzUT/FP6XoWhNCura7H85XI0j8oM5RGGMqwgOeVyoBCcHWrbth+
 0aeeLdAEAAA==
X-Change-ID: 20260214-stmfts5-b47311fbd732
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4267; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=bIh50GL4CnZVQ1HBuupaDiQHAlo2u2EqwjHC3A4x8NM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqnZXwEHVJKj3banu+VBWeGlK24lYDc54u8jRjl
 iH/p03zocWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCap2V8AAKCRBgAj/E00kg
 ckL7EACK+MJcE0uhqzVbLiPCH9nA91/x2b4Ava5iRzIU6awN/a34BdV18D/3la3WcJnqC37iWnG
 VJHU/ChWjAscQkYs9WUjEf06wDSCGCldTBy+mcv1T6pv7aeR2db5aSWnWgNE37vVRQ/UERCFbmo
 onTGM8nz9UMPQNaIo0UG3axIB5owkeNtspSl9UShbYvmER4tTM398RnyuBQd9NHHKm7zjNzDU6r
 a9t48vSyfWnKmo6+EKv19EKXxJ0YR7oE1fUk0/NoML8WVSh2yc5do7yaRcR7RHX2cqU/fjiPgVh
 E0qtrGYZ8tk+njoVXwS8Gl8K/fiXe3QyW3Lckh5cXENKa3adwAPwxdhbJvAq2bpn7zhJ8sFtANl
 u6Mpor3+HfSPPE2eCiDVYqu3yCZa1LdNBeZJsvqw1IXpbIgsD/pxxU3vviHP1nBaCeTcEbDUChH
 VXe0y0odVbbe55Xox3uu9lrffMN6kHLkVVKGs9yjALaxOh0iU5cKq4QfVK/Ha2kceyximuSdUVw
 O6WnnGmkjZ8aC2pUzuIeE69mmXDRwXRis25x+n0BxeBghkMgBA4olKCinLcM91+zhcpSYdtkXVn
 NOYSD51mifc1m9LbuvKJ+fQc4iszhuXuQoNWvAZZx13bRlhLsTB4Ax+5eBI+oo9O84yYY4QXXdk
 MgbLRxJ8gUdi9dA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Used on various phones. Minimal viable driver.

Includes device-tree enabling touchscreen on Pixel 3.
Also, tested on Xiaomi Mi 8 (device-tree is not yet inside the mainline).

What is missing:
 - switching between AP and SLPI mode (to be able to wake up phone by touch)
 - firmware loading
 - anything above basic touch

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v6:
- Enable only the multi-touch scan on FTS5 sense-on (0xff was wrong,
  only 0x01 is needed. This broke Xiaomi Mi 8 toucschreen).
- Fixed Y-coordinate comments. (Dmitry)
- Corrected event[0] parsing. (Dmitry)
- Dropped checking < 0 on unsigned area. (Dmitry)
- Dropped unnecessary i2c writes after reset. Verified against
  downstream driver. (Dmitry, Sashiko)
- Added pieces for supporting non-OF integration. (Sashiko)
- Shared input open/close into one impl. (Dmitry).
- Link to v5: https://patch.msgid.link/20260810-stmfts5-v5-0-0c737d929976@ixit.cz

Changes in v5:
- 3.3V is analog, 1.8V is digital supply. Fix that.
- Name the error variables "err" (Dmitry)
- Use scoped_guard() for ->running, and only set it once the scan
  mode has actually been enabled. (Dmitry)
- Use i2c_master_send() instead of open-coding a single-message
  i2c_transfer(). (Dmitry)
- Drivers may report coordinates outside the declared min/max, so
  remove the clamping. (Dmitry)
- BTN_TOUCH and INPUT_PROP_DIRECT are already set up by
  input_mt_init_slots(..., INPUT_MT_DIRECT). (Dmitry)
- Let the input core track contacts: drop the touch_id/stylus_id
  bitmaps and the hand-rolled BTN_TOUCH reporting, and sync the frame
  once per interrupt with input_mt_sync_frame() instead of calling
  input_sync() per contact event. The controller pushes contacts one
  by one into the event FIFO and only resends the ones that changed,
  so INPUT_MT_DROP_UNUSED is wrong here and is dropped as well. (Dmitry)
- Restore the FTS4 interrupts accidentally dropped by introduction of
  FTS5.
- mode-switch-gpios isn't required with stmfts5. Some designs, such as
  Xiaomi Mi 8, has no such GPIO connected and is limited to AP mode.
- Nit: updated example to use interrupts-extended.
- Nit: (maximum x/y coordinate reported + 1), corrected example.
- Link to v4: https://lore.kernel.org/r/20260409-stmfts5-v4-0-64fe62027db5@ixit.cz

Changes in v4:
- Wrap everything below enabling the supplies into stmfts_configure()
  to avoid bunch of gotos to power off on error (Dmitry T.)
- Finished chip specific ops and removed is_fts5. (Dmitry T.)
- Link to v3: https://lore.kernel.org/r/20260403-stmfts5-v3-0-5da768cfd201@ixit.cz

Changes in v3:
- s/touchscreen_pins/touchscreen_irq_n. (Konrad)
- Use interrupts-extended. (Konrad)
- Fixed rebase conflict against 8665ceb926ec ("Input: stmfts - use guard notation when acquiring mutex")
- Rename switch-gpios to mode-switch-gpios.
- Do not define properties in if:then: branches. (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz

Changes in v2:
- Fix typo in the binding s/switch-gpio/switch-gpios/.
- Deduplacate allOf. (Rob yamllint)
- Add missing S-off-by. (Dmitry B.)
- Dropped irq-gpios as it's not needed. (Konrad)
- Correct x and y touchscreen area size. (Konrad)
- Correct reset introduction commit description. (Krzysztof)
- Partially implemented chip specific ops. (Dmitry T.)
- Separeted license naming cleanup into separate commit (Dmitry T.)
- Link to v1: https://lore.kernel.org/r/20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz

---
David Heidelberg (2):
      dt-bindings: input: touchscreen: st,stmfts: Introduce STM FTS5
      Input: stmfts - support FTS5

Petr Hodina (1):
      arm64: dts: qcom: sdm845-google: Add STM FTS touchscreen support

 .../bindings/input/touchscreen/st,stmfts.yaml      |  29 +-
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  19 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   2 +-
 drivers/input/touchscreen/stmfts.c                 | 407 ++++++++++++++++++---
 4 files changed, 406 insertions(+), 51 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260214-stmfts5-b47311fbd732

Best regards,
--  
David Heidelberg <david@ixit.cz>



