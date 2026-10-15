Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB63CCA460
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vpF/gDsfow8fb+icnqCdMQxuKKuSB5DN8xtKyMVbhYg=; b=2VNKp1ClZUcIJS
	uuBfmVnEp170DcEu6EU/cUaAnZzNcBxZXE45Bu6LC8BzvxJCFiNct1gF2WiusQph7EG4aJ9wobbX/
	AvsNVIKL72ql84nKJRkdtat/4HSYhHj/t8YTr9wS1txJskvxui0NwymIF0ZafLno1m3AjK96TPoLF
	OjIsHyOcGRIx1ViOpT73l/Ec3tZeWglcR7vzwtKV3LrpXCt8BLPpaIeTT8hdmCYwU+xpWrCMTwfWv
	edRRF8FBaoVWZLTeKzcKf6WUgxC19NfsglL3g1QRiep1S9s/Kgh8YVPR9lk78CrYkV81sGkUPgwOb
	XQnNA712wnmnKkg7xGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEQ-0000000HVbg-2rXb;
	Thu, 15 Oct 2026 11:02:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEL-0000000HVZW-1bdj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 11:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=vpF/gDsfow8fb+icnqCdMQxuKKuSB5DN8xtKyMVbhYg=; b=mgTwHcZcp7dDpix5fO4Ep0eBWy
	z9nolOX1KJ41L4L9AbctvsaFlFWRxE6lMy7ZsBCqGUEBneNq/qQGi70gpDR/nktX/Cuu4MWy72BaH
	PcvbSlGiGaNlrAGgy3+iFABz+yD6Glvcp8Mr2mgJ/t9Yiazb6FauX9FuYdQBRUuh9GX7rqFWGbGJi
	6nfKYiX91ZI9SjnglstaEBs1P0KGneX2IrqRuRHl3gtUNiwMfT4ALq/4kZRRJS+DnNkr3Gm+eshMB
	gLrA7wLYONzdWMPzf9sjFnW+7uuIePZsaqW2l2h7WdnkcISi3H8efLHDzOFWA+rPrWCnhwsPARFOe
	OdopxobA==;
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHJEH-00000000HRp-4BWr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:02:36 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so5283209e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 04:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062151; x=1792666951; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vpF/gDsfow8fb+icnqCdMQxuKKuSB5DN8xtKyMVbhYg=;
        b=MV1Db9peCIA6vsbkMhgrBpnwvs2VliwIK9S8ZnQDq7iAZPNH+6U2Jxn45pHeoKWWXp
         Na+994u6nluYGMb3mw8i52xuYAG7+iAboubY+LX6IBLNkIXXCVX/2rO4+nz8t3UKYB2v
         dpZb5FGYTLByIIQraae6vbNWlSk/A5962ym4ZXJlZFuoBX3qIp822RzKMvx7H+yqo0/5
         AIfAy/bK4zIQW8f21aRCNDWlqweEQvW4cUoOxXclbjy34b1NsKtl9uMyK3971JWlrlfm
         FjPxngLRlQZ/mL6jzdwJjzEjEWnV3joG/iWimCifOBjksJzLUXfNzcBfSL/u5T0Mrogm
         V09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062151; x=1792666951;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vpF/gDsfow8fb+icnqCdMQxuKKuSB5DN8xtKyMVbhYg=;
        b=CQNT1cRrg9JaLp+E1tveQAwFJZt8VhYEtVIAcYjxaNDM+cgJvcsOtINKsymxf9avd8
         VSVUh3GzSgwWpqH2CNA7yYj1lE12g92vMUTM7+QMnXldw4HborFpGOafvMyQ2+koCevt
         EtosW2Jl1QrNtvHF9J9y1shiN+NMy2Gs9xfyk/zyI/bPcjagFtF4S7Kq1x+UOpMdlvmG
         /WWVSEtZc/0CbmYtE/VBitjxB/LmNUj7jM7fQ9YayCuhFcqtZ7Ad+Zn8gH+qgZBh/oeD
         pW+LhLYN4LxU6yzMrnn75WTiUNoi3qBPgTlrO4L1+GHYkBFS2tTpuTOgUm7CTT/F+CLi
         yoxg==
X-Forwarded-Encrypted: i=1; AKwUvBwWcADB1Lj7q2lQk4JId1CFY4HDCdWlQXhjsK6Wbi9G4Q48UrK+Ia/NhH2+Y7gSFZ6Ec7wuQ57B55s89wLd2iGX@lists.infradead.org
X-Gm-Message-State: AFq9FYK1hFFiLSpf908KcZZlShLACb2npFBCiFPMwUMkks3OQqqQNoo0
	ISZzWbiiDN1v7A2YnnNb807bZnzV6bCHkKAP7GE/0pb1F3Donin2EDsb9pEWIqNh
X-Gm-Gg: AYBFou0C+kEZjgmXPjTJcKBvLgM5y/jQVtooUjL+A/XOLdu98aAzzmL/gK5B5bc1uIj
	PkpbkS0WePne81Oh/C+Ox8Kc62Q3cA+ZMa4noDrLGG91FB82wlF0nCmLNQ+CODqXUTDDIjWw76+
	cxtc/nXmbU6iv/Whvtjx/PXdzQ5jGTI+PITW3/3IkURxTeVN7slDQCD1XBLw4UYkWYDbl2VfMas
	TijGRI4mV6Y6rWdNm9FP1fvi8eYn4cI1vxUsPsre0MgZdH1Za87WhthAblerTsZ8JeExWtx0C+s
	IAytTpcnuKdHHnkaECN82C0yBEbzK73jwI+7te7DI9vjPyEHq8WjNksbiIoZ47HO8GM4zMRvX+F
	74MAgD/q6tUkDxsoIYhR/PBEnhEdHAGHbP7ItvFbcqrjm5uYb0MxrFD9UCofQU0+6K8Xlz+jVhY
	YNrssUNiesLp7jYxZBaE9mjaHIFKgIsmng/EiKvKyjowx89F2RlhcFpuS10xvaXyHYR+cZkfkkP
	lt2yWHv+zfr4931ivr7qD8ekUCI1KBnblb7tTl7G66FwACFNgM=
X-Received: by 2002:a05:6512:3052:b0:5be:41af:8797 with SMTP id 2adb3069b0e04-5be41af88eamr376290e87.67.1792062150522;
        Thu, 15 Oct 2026 04:02:30 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:29 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v13 0/8] I2C Mux per channel bus speed
Date: Thu, 15 Oct 2026 13:01:47 +0200
Message-Id: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XSy07DMBAF0F+psiZoZvwcVvwHYuHHpLVEW5RCV
 FT133EqaKxmacvn+mo0l+4kY5FT97K5dKNM5VSOh3pA9bTp0i4cttKXXC86AjLAqPpCqd9/n/s
 IYFUWCqJzV19/jjKU8y3q7b2ed+X0dRx/bskTzrd/GUT3jAl76Mkn1sEisILX7T6Uj+d03Hdzx
 kR3hwCNo+qiZW+sTpmNfXSqcQSLU9Ux+JBMGmoR9ej0v7OA5Benq8simpOQs2nV0yyOmhlNpro
 hUooDs+O4+s+2zi7Ozj2jkJc0ZCcr5xpHzX+uOknORELt0IdH5xenUC/O33qiUz7oPMDKceOoc
 VydIaYIFjzpVU+EBTpoBopQJXBOAVTyAc1KYiPbkeK8M45i9GHwIj6tJLWSGzlvTTCAkC2pYFw
 rr9frL69fuvsNAwAA
X-Change-ID: 20250913-i2c-mux-b0063de2ae4d
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6441;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=euQQtVd/BkM8M86t1ev+NxS3ppr2DdnDQ0Zttt7cQ6g=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LKdMyFsR7fqPper1zTmeTEdklbNmw1vy1al5
 hX3IyJ3x1OJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCynQAKCRCIgE5vWV1S
 MnDbD/sHTPyzlN8rCAFJ5PJ89ack6FbZY7Zm1Ji8y7CJRlHbrJAiT9szD30+tvEsag4iDo74mhW
 0fG9D9jcHAsciDIWA9X75coeko85K3KbbPRv3k/FxeMj3svesXWgZPIfYRJhPG04HrrpRQyX2Cp
 6vlAL8YxGjxA1wIR+YaK+/TbHa9yz0uii8+n/GBfgzVEbKgQJ8T74cF1AXkxWjJKk3HR/rCiNr8
 bYAsaVAQJS9dNY+j2IXa1ZFV+RsRQE8/26wSK+45N6r32tV+TfkSskwYcJ7V60b4yMfXettt/1J
 omzEM5ZMQ/b13D59FbtcapBKgE7bXzTswCrXGnupiAPHaBpOhOIsBrpUp5xu9belfGSiEn/012b
 yvQWHk7bOgeSFMrRxnIz9kyaTLlwNZWrN8IAlpM5e2SZMcHn5kMqjbD6oCpXpb8fS4bTsbWG9Fh
 xj++zbzbhJw40m3lPg7mmil07QLlqrFd0mm66nBStUGfWrGPBMxe2fV8F+HCGmwkIrouJSfAoyv
 vDrgz/eh63hiRAFi/0dtCpYv6RjGJBepsjzCSx9GIfxzYFACcRcIdfpM1NA+6iKhfOsKpNN8WnV
 hOxrcSAZdo0GzLeAU/QBkLKtJKsGxHsOKU7jWZBi/21tahISAKvnE4E8VYCS3Pui0lAB4FbC0g5
 BAALDZ+WbEGjdSQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_120234_370133_91F9A0CA 
X-CRM114-Status: GOOD (  26.00  )
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

This was a RFC on how to implement a feature to have different bus
speeds on different channels with an I2C multiplexer/switch.
As no major complaints on the design came up during the review, I
decided to submit the series without the RFC tag.

The benefit with this feature is that you may group devices after
the fastest bus speed they can handle.
A real-world example is that you could have e.g. a display running @400kHz
and a smart battery running @100kHz using the same I2C controller.

There are many corner cases where this may cause a problem for some
hardware topologies. I've tried to describe those I could think of
in the documentation, see Patch #5.

E.g. one risk is that if the mux driver does not disconnect channels
when Idle, this may cause a higher frequency to "leak" through to
devices that are supposed to run at lower bus speed.
This is not only a "problem" for changing bus speed but could also be
an issue for potential address conflicts.

This patchset has been used and tested heavily the last months
on a custom board based on a da850 (DaVinci) platform.

The implementation is split up into several patches:

Patch #1 Introduce a callback for the i2c controller to set bus speed
Patch #2 Introduce functionality to adjust bus speed depending on mux
         channel.
Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
Parch #4 Implement set_clk_freq for the i2c-davinci driver
Parch #5 Update documentation with this feature

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v13:
- Rebased on i2c-next (7.3-rc7)
- Corrected gramatics and wordings
- Move set_clk_freq callback to its own structure (i2c_bus_ops)
- Fix style issus
- Don't leak childs anymore
- Link to v12: https://patch.msgid.link/20260719-i2c-mux-v12-0-a5010d623a57@gmail.com

Changes in v12:
- Defined new idle states in i2c-mux.h
- Replaced _hz with _Hz where appropriate
- Reword comment and commit message about idle states
- Link to v11: https://patch.msgid.link/20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com

Changes in v11:
- Rebased on i2c-next
- Use _Hz instead of _hz for local variables in i2c-davinci.c.
- Link to v10: https://patch.msgid.link/20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com

Changes in v10:

- Fix gramatics in documentation
- Move {__,}i2c_adapter_set_clk_freq() to i2c-mux.c
- Make set_clk_freq() return actual frequency
- Reimplement idle_state (from earlier version)
- Implement example on idle_state for ltc4306
- Link to v9: https://lore.kernel.org/r/20260324-i2c-mux-v9-0-5292b0608243@gmail.com

Changes in v9:
- Fix stray blank line
- Link to v8: https://lore.kernel.org/r/20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com

Changes in v8:
- Fix gramatics and change %d to %u were appropriate
- Link to v7: https://lore.kernel.org/r/20260223-i2c-mux-v7-0-ec75b214718a@gmail.com

Changes in v7:
- Remove code for finding first mux-locked ancestor
- Introduce a unlocked (i2c_adapter_set_clk_freq) and unlocked
  (__i2c_adapter_set_clk_freq) variant
- Let the locking be handled in __i2c_adapter_set_clk_freq
- Use I2C_MAX_STANDARD_MODE_FREQ instead of magic numbers where
  appropriate 
- Link to v6: https://lore.kernel.org/r/20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com

Changes in v6:
- Change logic to find which ancestor to lock with I2C_LOCK_ROOT_ADAPTER
  It now find the first mux-locked ancestor and then lock its parent.

- Remove bus_freq_hz in i2c-davinci and only use clock_hz instead
- Mention in commit message that clock_hz can be used to store frequency in an uniform way

- Swap order for change freq/deselect to keep symmetry
- Only allow bus frequency to be lowered in select()
  This to not allow an intermediate frequency to be set when it is not
  supposed to

- check if(ret) instead of ret(<0) where appropriate
- Fix typos in documentation
- Change i2c_adapter.clock_hz from int to u32
- Simplify i2c_adapter_set_clk_freq() by removing 'ret'
- Link to v5: https://lore.kernel.org/r/20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com

Changes in v5:
- Take the lock of the top-most mutex locked mux to make sure that the
  root is locked
- Link to v4: https://lore.kernel.org/r/20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com

Changes in v4:
- Rebase on master
- Swap order for printing warning about "channel %u is slower than
  parent on a non parent-locked mux\n"
- Fix typo in comment, adaper->adapter
- Link to v3: https://lore.kernel.org/r/20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com

Changes in v3:
- Return -EINVAL if channel is faster than parent (kernel test robot)
- Link to v2: https://lore.kernel.org/r/20251002-i2c-mux-v2-0-b698564cd956@gmail.com

Changes in v2:
- Changed bus_freq field to bus_freq_hz in davinci_i2c_dev (Bartosz Golaszewski)
- Removed idle_state from mux core (Peter Rosin)
- Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a610930@gmail.com

To: Andi Shyti <andi.shyti@kernel.org>
To: Peter Rosin <peda@lysator.liu.se>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Marcus Folkesson (8):
      i2c: core: add callback to change bus frequency
      i2c: mux: add idle_state property to i2c_mux_core
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      i2c: mux: ltc4306: set correct idle_state in i2c_mux_core
      docs: i2c: i2c-topology: add section about bus speed
      i2c: mux: pca954x: use idle state from i2c_mux_core

 Documentation/i2c/i2c-topology.rst  | 180 +++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c    |  39 +++++--
 drivers/i2c/i2c-mux.c               | 196 +++++++++++++++++++++++++++++++++---
 drivers/i2c/muxes/i2c-mux-ltc4306.c |   5 +
 drivers/i2c/muxes/i2c-mux-pca954x.c |  76 +++++++++-----
 include/linux/i2c-mux.h             |  57 +++++++++++
 include/linux/i2c.h                 |  12 +++
 7 files changed, 518 insertions(+), 47 deletions(-)
---
base-commit: a1844c195998e764ed89ceb29a234d2be690f404
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
--  
Marcus Folkesson <marcus.folkesson@gmail.com>


