Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A19C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 21:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qg/ya/CK1VcXec0zwGOyCTCqsc/pnziSCOkX0UhyENE=; b=ISA30KrUfnT88VppR/loAd69bQ
	KRyjwJOLt7tXjHhtZmF60rlyKSSA8v1F0jW4JpqHz7LkKA4m5cQd8HteuWTo+yxybFd8EZozwzu2A
	Zmtvj8Mc8cj8Aal1ywTBG7NzaLFZtoUXOd2yMoJsMFuCBwbPqKKQIJ+v8/fFBUmyMAz4W1iSOXsqM
	cBIeMi+zJqxUslmWx85UFmxU8OgahLSfRi97yCWiHPF0YX3sJQGdglwTUMpu/KGVA6mkm5QQoMLOB
	XsmmKNLmuHOVAydF48FYFEnJuFAcidN0JDGgLmC0Yi9VQBZ8X73HOBS+ZkhmKGsu9sKoOG+ZDxIiZ
	3u/YLUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADNm-0000000EUBm-2a8S;
	Fri, 25 Sep 2026 21:23:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADNB-0000000ETxw-1nIj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 21:22:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E589060136;
	Fri, 25 Sep 2026 21:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A258C2BCB8;
	Fri, 25 Sep 2026 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790371342;
	bh=NYGGX08Rh22ux8AkT9s+UILhXOkXRQN1DhjSewJHGj4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EF7K2XMGYlIp9VpZQw30KyQD+fexSlKECTJBsvLNMH6BfUlvK9Y80EnsKCxWQuEYQ
	 SOqp0Ld1yHR5NeCq6oKNlRxv1Kefv+k8eP1mNDEW9UAtTf38AcOHfzwsrHcuYkK6bL
	 OptVH+MmZApIKTWKDPBHb6aIBSg+9a64TxreeA5qXT97SVlbAKgbYuEV18vfaaaSHa
	 pzib1ZR2OI21zMgj4MZOXhnLReE0xI00Jmbd1CmzcszovRJoCHLJwq5XxWAHjXW0jv
	 8RE/esKwJm/CFhCWL0uRGxTlXKHFo6bkPB/jOjuhJvpA2vduYnriU7f+tkRIgtew2m
	 CXelqqLGa0Dwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D77C9832A;
	Fri, 25 Sep 2026 21:22:22 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v8 0/5] Input: support for STM FTS5
Date: Fri, 25 Sep 2026 23:22:18 +0200
Message-Id: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13QTU7DMBAF4KtUXhM047E9NivugVjEf9QLWhRHU
 aHK3XGKhNMu33i+p5GvoqappCpeDlcxpaXUcj61YJ8OIhzH00caSmxZSJAGJKqhzp95rnrwigk
 x+8gkRdv+mlIul1vT23vLx1Ln8/R9K15wm/51EOB/x4IDDFIGpa13YzD2tVzK/Bx+xNawyJ1C3
 ZVsisEHSyk57fBeUVcKqCtqSseRjQ05SnhQaq9cV6opo3Iy7Ymj1/dKd2URutJNQWDi6KRzbO6
 V6cqB6cpsF0L22YzZMj78Bu8Vd8VNqVETWQwRaKfWdf0FhRF3QeABAAA=
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
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5706; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=NYGGX08Rh22ux8AkT9s+UILhXOkXRQN1DhjSewJHGj4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtuYMZRK6dVaJ8gJpvVKh2HmICVoHNTi2sCpAt
 jefMomniYaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarbmDAAKCRBgAj/E00kg
 chd4D/0W2SNOEooROfqD6meWgaQDNnkiYb0LaZSwBE9pwsOD20aRosXFOkB23BHUkmsBXRJhvg3
 ROuuOp9OuOR1RVpbzPuyLp132K9cs7KAeWOw7IODS6qPmJMfYC8HE1EaJfxgYaVmDZEG5W+vDup
 EuiULs74RDDlQmcX5qgbMEydMGwzuLzXGrWnrfUM+PkTp8+lThqxf8WxKRgyLsYn6/aL2nuRpn5
 ZiqJFJ4qoYKDIn3yH7pwvfNzb30shKGSFxI/UpMB1X61X93gLWjas9FgyvIgfzvFcdX6XR270yy
 pHfLjpuH5OQoOckxaKddivReiX/m80PwDyznLl9AugrZMpjtVzg1MT1u9NgAsMD9kxJ0HcrM6Bu
 tiz2zvZncgWyQKCdMn1WLLjrEgcvJp5mgAoqEbDJJFC07W5+Qk5oF4Wsx2VV8Yzvd9qzVWM4WIG
 zIHWfZW+xvSemfAJ0htIXGwtfTXvlkWcGBtp0KRvOtEekejIl0Z/YDl+yI5Ctefu+M+s8yDlIBd
 CGbR0wkWJRR1A65YPrlTfHdWxaOUJtuVMuXSbB5If4XZwTNAk0dFdj2Tg8ZKqVqInhHidSbKj1g
 IbhcK6KZFNi3IMPxiPzDeG/LhRzkG2bqjyKT80CuCjz+X39NDP+Hx0PMucz5JZKiK09jA01X2hu
 JAY7lx0s38bWwTA==
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
Changes in v8:
- Split DT binding example changes into own commit (Krzysztof, Dmitry)
- Refectored the stmfts_power_on fix. (Dmitry)
- Added ABS_MT_TOOL_TYPE. (Dmitry, Sashiko)
- Link to v7: https://patch.msgid.link/20260907-stmfts5-v7-0-4a53381cd038@ixit.cz

Changes in v7:
- Added 'Input: stmfts - wait for controller ready after reset',
  the waiting is done for both FTS4 and FTS5, similarly to the
  downstream driver. Should improve reliability everywhere.
- Link to v6: https://patch.msgid.link/20260906-stmfts5-v6-0-50fbf6af8718@ixit.cz

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

To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Petr Hodina <petr.hodina@protonmail.com>
To: David Heidelberg <david@ixit.cz>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Henrik Rydberg <rydberg@bitmath.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
David Heidelberg (4):
      Input: stmfts - wait for controller ready after reset
      dt-bindings: input: touchscreen: st,stmfts: Improve example
      dt-bindings: input: touchscreen: st,stmfts: Introduce STM FTS5
      Input: stmfts - support FTS5

Petr Hodina (1):
      arm64: dts: qcom: sdm845-google: Add STM FTS touchscreen support

 .../bindings/input/touchscreen/st,stmfts.yaml      |  29 +-
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  19 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   2 +-
 drivers/input/touchscreen/stmfts.c                 | 462 ++++++++++++++++++---
 4 files changed, 443 insertions(+), 69 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260214-stmfts5-b47311fbd732

Best regards,
--  
David Heidelberg <david@ixit.cz>



