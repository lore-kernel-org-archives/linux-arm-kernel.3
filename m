Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A35CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3phMkwYfm56eqaIllq9SuGY8VDAAtMNYHrtgGJ8TFRs=; b=4oF5rPcN+Juu1c
	7wFIgwdobdnDsaWlPNNaC9QB7FPd9/2LBmL3hImBZ2Fhfj8UHhiW60FWOjxuPJkhd8x/Y8JGZ4zd+
	gl62TMFRRjaeWHmS/mhwss7BUAW0IKU2/GEVkh7MCK3aJemn9na0thoyj3lwLHxoLRUwIwnvJHnUP
	+GUiU4eSJ4pM3jjZA5/ttYm5J48/P4jMZeahDoEyzc6vAaw3Cs4y73WzhoLa9eZK7lqfsy908qapf
	SjXoq9G9tl+zBT2ieJ32ENlZrSILOQIxbqFhEK7mDiM5Q4ggKGPzF1bNFym3XhM6fgV3ZDx9Coj9x
	kN79+PFkID6fBbGJ52kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWD-0000000ETcj-3GN3;
	Mon, 13 Oct 2025 20:51:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWA-0000000ETcK-3LEh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:51:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so49608935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388701; x=1760993501; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3phMkwYfm56eqaIllq9SuGY8VDAAtMNYHrtgGJ8TFRs=;
        b=RxU8RSgHdsG1JEVddTRk723MEC848nLmJNucq0GoCHDBVZF1hisQIJ722XUF6YNVmq
         92RVkcbfk/BniEWQFO2CSjCS17azpCvF4pYdwq0j309BEvR6dx5w9gWK/ELLtrXJdY/n
         eysmJt3zXJvwcPPc6DM10WdRX+uN30kqpKTabLGsWil86akz4wiLmCqz+vzYU4E+q4mV
         q/3m8pEudCwEdkmt/+mTG3dCVHspk0rgAZyniz/bmYiNO54EAIaAv7p+Vg2QTOAs2o3L
         KeBTNPr1ZiS6vA0pb4NQsu5UeTrdVLe+hCEGpGy+PdnAG9vDboNKLhlCJzCti8WwgDa/
         6usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388701; x=1760993501;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3phMkwYfm56eqaIllq9SuGY8VDAAtMNYHrtgGJ8TFRs=;
        b=euF06b1UJXNZ2ejhGDodWjAzqAnMsCYxZtEhKkG/nyYl20n1tMTZE133QzK7UKgmhl
         1qonUDXrgmIHVYwkx95dfDS4y8LsvdzPvqEZDS+lSy4R5jvmtfGczIZqJkaBgNPHtLrW
         AqQBR5b3NB0jKqDQ0tsqujWHsXou3QSRWo3bTPVXzQJ0UeKni/uHN9lRVBcjjKabIcUW
         Y1OYbvo/hywAKZhqX33NxT5WRdd5ZGCOOj6j5XcqkXBGexg9jkTXcxFhmobRqxZSe/m5
         17gFvYjkK5Xs+AYXP/NPHetGwraZOE7pmqdOj1bHy1Z9HIHC0PznDcl5/O6FEUu63ia4
         XjZA==
X-Forwarded-Encrypted: i=1; AJvYcCUapwiNkmtBWtflFJI94fye5SMuWeWCqNQk5hY6EiEgAS23XGiZqujuRMNr0frRfv0S/UkMzjDhLfsEhTL/8UnY@lists.infradead.org
X-Gm-Message-State: AOJu0YyyTN3w/OCJfCdSZS3plIxxKc7CY11G46HNpA4CmvDTKD0W3Hhg
	gRo9vhRYxOCotqG/QQPlIIA6EyVPjJyOK48uk6dtgbl1Lc3qMKG8rQY/ljtZRP3wjpGzz3zrvDf
	VB/Hl
X-Gm-Gg: ASbGncuoFWzBfan8S0l4f3KMlSIx1uOXACb1qWooYYJmt3+tpGg0425SHYXaHurlQlC
	GPz312NhtLRD73gRXuMaOx7RA4Ol4m9kGdxfRcaNgMw4pu1yFoZ5Bu4CmVseEPTdxje2BClOaOh
	D5gxjwEFSUrZis00AliJClTm7t++zXXF1ptHgDr7ccPQLlWnLHRfyn70pgnkEBOARv/htVebHkF
	yRcXamU9bVKzj2254BxBUS2jjzMxAbjVawKzb45FmtxKUKPF+UQNDTo5l4KdxquThaCoHKJyTiv
	nZszgL1yordXRMdwMhPJPKOKe4Dm+bL4Fq7SRwMfmEp1xR4HcqeuaE7TFEiItswAFUjyJWhiH5/
	+9jwjX1iAg++qANJDx4vD3ff8a1vSOHztNt1FiBLzRb6l04WOKj/OWmaDefXPJ5P5GKm28KEpyp
	k778xfPzUC3Q==
X-Google-Smtp-Source: AGHT+IGjjsbDzQn+sXb2Qz7A3620Q6W+fxPbSimJibDpQdTq4Os72DJCSBPNVGKdtBeOAoH4qYHh8A==
X-Received: by 2002:a05:600c:198f:b0:46e:3b1a:20d7 with SMTP id 5b1f17b1804b1-46fa9af8595mr180676445e9.19.1760388700609;
        Mon, 13 Oct 2025 13:51:40 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:40 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/9] Implement hardware automatic clock gating (HWACG) for
 gs101
Date: Mon, 13 Oct 2025 21:51:29 +0100
Message-Id: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFFm7WgC/x3MQQ5AMBBA0avIrDWpBsFVxKLGYIJW2hKJ9O4ay
 7f4/wVPjslDl73g6GbP1iQUeQa4arOQ4CkZlFRVIWUj9BXsoQOjwN3i5oUqWz3Wcq4VEqTsdDT
 z8y/7IcYP21AcqmIAAAA=
X-Change-ID: 20251008-automatic-clocks-249ab60f62ce
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7152;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=wk0OHltmWW1u/FhLNOtkFQyvYtv6HXEbZIlrMYmGWwk=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZWXRe9IcAtzTtKaHSH00s2wgfJFS7akr0qz
 wXfB6tHhDWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mVgAKCRDO6LjWAjRy
 urCcD/9ImwTZ5kh61Bp5J4uFb8ht0NDGLanBjKZWvOK5b+cG+4bP38KKpx1mO7C/n+1dU/9cRoT
 Rwmde+IRRO3sqDXv/R4lOfKNC+uu9pgRSlfRYTUzAm/3eGwu6fkMaG+F3j/cjwaYIzrIpLkm5t8
 oDHvGpNCbvKD0ZWqZYsGBXtWlG7MpLRRAGU7xmeRA7U0JquUs3GFp35GgzaeqQnAOGASUSduHmv
 IGsW+vAJ/+jEYxxHMdsRZT/sSAzTKf3l55YGJfJt2sT+oQ0DzX0l51gVEDsH7xipCnu+0YCurBh
 ltvBxAZY978GkiSWwTurs/1XSOCTf3Bl6c6iggATCDasUFty+carKY/SIqrkOlufcbSBZvytMDe
 1dk5Jh1rXJZdjeiqOqiKxoc+BtmY6OHrkSWJ0LZRufLhWkudpsvwONQf/sJNrWtq8pAegEsMutr
 dQu0X5xONOcVTGtSnbHpbVqxpwrEhCYS/Ur47DUIX5x/79mGzbOK2x2gN1L74lS+8oGkeE5uvs8
 lyaCQsmzTe6hMMi2V6Mb6tL8xriIUmEgMiHN6PdFIaXlyG+5Wa5D7OIueMyDCD/haIip/i9C/H2
 eZQ/TXc87BnRpGOYkc75RICvDD1aSh5Qcd2a+Aczlp4oeV+53eLaD1Lxt1o96wPhLxSFbDxhRVq
 M4E1RJTzdFiWHyA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_135143_054333_1137F56E 
X-CRM114-Status: GOOD (  29.09  )
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

Hi folks,

This series addresses an issue with Samsung Exynos based upstream clock driver
whereby the upstream clock driver sets all the clock gates into "manual mode"
(which uses a bit that is documented as reserved in the gate registers).

Another issue with the current "manual clock gating" approach upstream is
there are many bus/interconnect clocks whose relationships to the IPs
are not well documented or defined in the specs. When adding a new CMU until
now we have tried to label these clocks appropriately with CLK_IS_CRITICAL and
CLK_IGNORE_UNUSED but doing so is both error prone and time consuming. If
your lucky disabling a critical bus clock causes an immediate hang. Other
clocks however aren't so obvious and show up through random instability
some period of time later.

Fortunately each CMU (at least on newer Exynos) provides a "hardware
automatic clock gating" HWACG feature that is used by the downstream
Samsung clock drivers. Hardware automatic clock gating uses a hardware
interface between the CMU and IP to control all clocks required by the
IP. This interface is called Q-channel, and is part of the Arm AMBA low
power interface specification [1].

The advantage of using this Qchannel hardware interface for
enabling/disabling the clocks is that it takes care of all clocks
(including bus/interconnect) ones for the IP automatically thereby reducing
the dynamic power.

Whilst each clock component (GATE, MUX, DIV, QCH etc) has a HWACG enable
bit there are also some "global enable override" bits for the entire CMU in
the CMU_CONTROLLER_OPTION register.

This series makes use of those "global enable" override bits to enable auto
clock mode for the entire CMU and every component within it. Through
experimentation we can see that setting the "manual mode" reserved gate bit
on a particular gate register overides the global enable bits. So the code
is updated accordingly not to do that.

Auto clock mode has been implemented as a "opt in" by setting a new
auto_clock_gate flag in the CMU static data. The intention is existing
platforms in manual mode should not be effected by any of these changes.

If auto_clock_mode flag is set and the option_offset field is specified
then the global enable override bits will be written for the
CMU (to avoid relying on any prior bootstage configuration). Again if auto
mode is enabled the code no longer sets MANUAL and clears HWACG bits on
each gate register.

To have dynamic root clock gating (drcg) of bus components and memclk
enabled, it is required to set the bus_component_drcg and memclk registers
in the the correspondingly named sysreg controller. If auto clock mode is
enabled the clock driver will now attempt to get the sysreg syscon via the
samsung,sysreg property (as used by other Exynos drivers upstream) and set
the registers accordingly. The suspend/resume code paths are also updated
to handle saving/restoring registers using a regmap. Note cmu_top is an
exception and does not have a corresondingly named sysreg_top.

As all clock gates are currently exposed in the gs101 drivers and DT, we
continue to register all of these gates in auto clock mode, but with some new
samsung_auto_clk_gate_ops. As clk enable and clk disable are now handled by
Q-channel interface the .enable and .disable implementations are
no-ops. However by using some CMU qchannel debug registers we can report
the current clock status (enabled or disabled) of every clock gate in the
system. This has the nice effect of still being able to dump the entire
clock tree from /sys/kernel/debug/clk/clk_summary and see a live view of
every auto clock in the system.

With the infrastructure in place, all the CMUs registerred in clk-gs101 are
now updated to enable auto clock mode. From dumping
/sys/kernel/debug/clk/clk_summary it is possible to see that after enabling
auto clock mode approximately 305 clocks are enabled, and 299 are now
disabled. This number goes up and down a bit by 3-5 clocks just on a idle
system sat at a console. As the CLK_IGNORE_UNUSED and CLK_IS_CRITICAL flags
lose any meaning in auto clock mode they are removed. It is now also
possible to boot without the clk_ignore_unused kernel command line property
for the first time! Prior to enabling auto clock mode 586 clocks were
enabled, and 17 disabled (in part due to having to boot with
clk_ignore_unused flag). To ensure compatability with older DTs the
resource size is now checked and an error issued if the DT needs updating to be
compatible with auto clock mode.

For future CMUs in gs101 I propose we continue to expose all gates, but
register the CMU in "auto mode". For new device drivers or updates to
existing dt bindings related to clocks to support gs101 I suggest we only
use the "obviously correct" clock(s). By "obviously correct" I mean a clock
has the IP name in the clock register name, but not try to deduce other
obsucurely named bus/interconnect clocks which will now all be handled
automatically. Note it is still possible to test whether the "obviously
correct" clock is indeed correct by putting the individual gate in manual
mode and disabling the clock (e.g. by using devmem). 

Note: As everything here will go via one of Krzysztof's trees I've sent it
as one series.

regards,

Peter

[1] https://documentation-service.arm.com/static/5f915e69f86e16515cdc3b3e?token=

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (9):
      dt-bindings: soc: samsung: exynos-sysreg: add gs101 hsi0 and misc compatibles
      dt-bindings: clock: google,gs101-clock: add samsung,sysreg property as required
      arm64: dts: exynos: gs101: add sysreg_misc and sysreg_hsi0 nodes
      arm64: dts: exynos: gs101: fix clock module unit reg sizes
      arm64: dts: exynos: gs101: fix sysreg_apm reg property
      arm64: dts: exynos: gs101: add samsung,sysreg property to CMU nodes
      clk: samsung: Implement automatic clock gating mode for CMUs
      clk: samsung: gs101: Enable auto_clock_gate mode for each gs101 CMU
      clk: samsung: gs101: remove CLK_IGNORE_UNUSED and CLK_IS_CRITICAL flags

 .../bindings/clock/google,gs101-clock.yaml         |  23 ++-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   4 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  36 +++--
 drivers/clk/samsung/clk-exynos-arm64.c             |  47 +++++-
 drivers/clk/samsung/clk-exynos4.c                  |   6 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |   4 +-
 drivers/clk/samsung/clk-exynos5250.c               |   2 +-
 drivers/clk/samsung/clk-exynos5420.c               |   4 +-
 drivers/clk/samsung/clk-gs101.c                    | 167 ++++++++++++++-------
 drivers/clk/samsung/clk.c                          | 161 ++++++++++++++++++--
 drivers/clk/samsung/clk.h                          |  49 +++++-
 11 files changed, 412 insertions(+), 91 deletions(-)
---
base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
change-id: 20251008-automatic-clocks-249ab60f62ce

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


