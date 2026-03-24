Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1710F54AB0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QRP8waOAFbU/kyinDmGT7grAQld1bjZSxa4dUhXQ9j8=; b=ZhwVqIjMkDaAgv
	YBivmA00q5t29nU+ngghmupTynnhiEvC5fhLDO/TCM3u45tGsqCUrT/OEGlIMUVIpQmJJqQQtUZ5r
	4tF3mg32Wk9n4cUIT9iK9dgw6YVjTfmrZsZ0KDpGa5lc3LD7rhdcYNx3rKhVTcmmhaMjK1XobwYC0
	V33GanOazeotQRhppRmtqxdzOlAPZuO5r3W5THXs9DizEU1+bdw0B4hxvOz+ekd5ysmDhZX/krX0Q
	AMRu2ncHbDiP2JoezakNnNZurBAbNkLvk8bV/Nw0Cx41vCrGaG7DmPYFLfDlYrByWlGN/KYQQPAHP
	BbFuZINx6JCqa0nfXvFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52DW-00000001aIb-11PK;
	Tue, 24 Mar 2026 13:54:46 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52DR-00000001aGM-0AVA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:54:44 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a27c021b58so1400828e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774360478; x=1774965278; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QRP8waOAFbU/kyinDmGT7grAQld1bjZSxa4dUhXQ9j8=;
        b=shhhdmOPN26jCkSwoISn1Tg1kV7R2U4kyXYnC6q8T9Pvb0x1+mfM7WCqjf4+sMzL4R
         7xP8oKcXFHH0m9e3SyiFYmjNwR2cCsC3zoYWENBEYhiFzQZhJiXdpMIqjnie6y/heUHG
         bTU6ObznoJ5jHzwUXFmyqsi3aOT/6DKTVlVpaiUnSS8XmEhJY06CLMckURiblcqpnyjt
         t0XwT++6wd1DArTKrmiy6XQWgmzh6f/KjMTCxrvekzw+b6GY3zP+f29+IFmyWhjrLzPt
         BLBX0tbgIuQIO+SXWfpBZ4QBZSGtGnZy072+0fFGOvrJiovhu+FQ+/A7ZVE42duqBy/G
         PKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360478; x=1774965278;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRP8waOAFbU/kyinDmGT7grAQld1bjZSxa4dUhXQ9j8=;
        b=B7VuNVeQjV+9P1mU/rU/nm1l7DzAtu8UDxVYvDzliuZIYnHrZq3Ey+6c9vCaYc/Wvi
         tETFKCG85gLw7ONa8tUY/B5YFdIm0WITYd/ziEp8O/ja6CP+mAXvhRnx1lqa1bhiyyG2
         xDutNQzGpgA9DZJxvtTROEb1eQknGNBPPhODOftHyBTT9+94COaTCuDQ5E7QJyJ4S/cu
         zmiRmXUfP/mNimgwvTFu++8b+gu2PmwGLxcp94GZ+Skn6YWnRK7uiRpZl18ze8W3T8FK
         gFsVuA3Zn6bsSVUUeeKpSo2zX7RLfxRlCJGlymn7ycjkUCqMDQ+SkvSOYyL34+dnvWa/
         TMmw==
X-Forwarded-Encrypted: i=1; AJvYcCXxDHJxoVF/v6NlblIrlz536qBbqRwiANnbIuToGFewPnpvUZry/vJPu9NVdo2v1OPFeaI7YOIryDRb4wOIpOnp@lists.infradead.org
X-Gm-Message-State: AOJu0YwOO8QB4yrJAkkmapWQYNHpWrvwmoy/nxCD6hh5059YjldiBNs6
	cqvD76P4aOhfWvtoZRfflzs2vIq+NExIYK8v9mcZkmYbhmTeedFrwWxm
X-Gm-Gg: ATEYQzzdQvkiB8uTJGmOIpSRqs88JnKlzaAJJYbGeoHv9wI+a5XkhB3aYFN7rGC9Xvr
	/sT52DazgZJ5PBiQ2wIS6vSXAQM6db5TwpJkg4NcmIU2sJgu36tuMWCikcp6up1vWtgpW/QB4Qp
	sbgOcul7gh9Wovh5JhqanD4Q24nolmlJCDt/u+RgcmI5QZcEVdZKZaCMZGaY+rFWAw3SMWpnoNf
	UmrbKgGlRHOzU0kOGrCw5Fq9Thsdh76nd8KQXYkSLnj88EeTgABtbOxQGEdeTaA6YW5raCTnNX/
	MUDgXUf5z06llE4yAg+dTdwtAzGPyDiSdJZN/blVDasNDBixv5yxY+SYmyxdF8AG37mywcO2KY3
	YvBrLKp51jWFdUssZqCfs6oggXdC96zyYJEl6MMMHtIyPJfG1K58GKif+AEgpmdaCeL8dm081s3
	J7tk91YiB7zFGaVjhRSjqLO6wzNJqehaqT4UbLkoVixud5mZaXtMrdEYm7ayV847E9TBuY
X-Received: by 2002:a05:6512:1092:b0:5a1:1e49:66 with SMTP id 2adb3069b0e04-5a285b4c3b1mr5765705e87.29.1774360478127;
        Tue, 24 Mar 2026 06:54:38 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207454sm3162823e87.48.2026.03.24.06.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:54:36 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v9 0/5] I2C Mux per channel bus speed
Date: Tue, 24 Mar 2026 14:54:14 +0100
Message-Id: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQy07DMBAF0F+pvMZoPH6z4j8QCz8mrSXSVAlER
 VX+HSeCJjTLsXzuXM2NDdQXGtjL4cZ6GstQunMd/NOBpVM4H4mXXGeGgBq8kLxg4u3XlUcAIzN
 hIJVZ/X3pqSnXJentvc6nMnx2/fcSPIr59TcD8Z4xCg4cXfIqGAFewuuxDeXjOXUtmzNGvDsBs
 HFYXTTeaaNS9to8OrlxCKuT1XlwIenU1CLy0ak/Z0CgW52qLhMpnwitSbueenW4udGoq2sipth
 4b33c7TNbZ1Zn5p6R0FFqsqWdsxuHm322OkpWRxTKChcenVudFGp1bukprHRB5Qb+uWmafgDJR
 B1cJgIAAA==
X-Change-ID: 20250913-i2c-mux-b0063de2ae4d
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4744;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=mjEq1PLPEBk6WppdYqh8OnJbPCI24wJUo693CNzhVxg=;
 b=kA0DAAoBiIBOb1ldUjIByyZiAGnCl4ihOVbUM1/DAKdpFQ8kxKpUb1xZtLbfo7fnf7aT5M0Dy
 IkCMwQAAQoAHRYhBAVRoui2bLVNZMEsZYiATm9ZXVIyBQJpwpeIAAoJEIiATm9ZXVIyj2MP/0hO
 tjuOdfF26sMuJ2cbc6bBmzIEMSZmxyH5GEfLehZpPRVjH/Sgl4/mDurhso2APzEkySojOB80RHO
 u7jA3MEBLMtBq9YipSxFaTkaTUFbqQGr4zLWS7ZOxhmOce9QH5qQK7HP8ITp5ywRaG86A7QkUjJ
 bHIVGs3U/qYm8OlpnBz177dnMTB6BuOfvaFmLfoi/rXwBu0Jitj8vzc88BkGtfU70TIrXHssqDA
 QzhElYpAExnxxffLYP7d3k14TBh3SUPLLEAp2ltlMidqAs3+MU516VVvvPP0sAVc0iXtn8qgRiA
 W9weKNO/WDm49aC3Ior8fHTFoEEbYaoWjCCXLy8tyhlJjTDtBJb4QWLPKQ/+jXnSVb7G8+cINPz
 JTfzvwAk3yq4Hf3EWgMgjs8A85Cfwx5GA3gALok5qvh+7aHxRpEAqHkL48R+rD40/KPlftVo4Cr
 K3JOwOs1VX86Uxq/zMBtO1wluKIv4y1mJN8+nTDBL/VFRckwy77s+g0VBnHGPasxCEgFYETesCC
 klXG989ANI5EkE4ZOODdyr/nKLtX8lPmW2dFJMQvBKLFnFltv73BPByA4esSz9ZzC8s/O4Fmmnd
 ijk8qvKY+6/A/XfZdXTMYlBUVYNkoFBiJoPpdUp4oDu7VRRVhyCXWEcjrAXeZwoeLQfm0do7dBT
 udbmD
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_065441_212995_32B4800E 
X-CRM114-Status: GOOD (  22.97  )
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

---
Marcus Folkesson (5):
      i2c: core: add callback to change bus frequency
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst | 178 +++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c   |  43 ++++++---
 drivers/i2c/i2c-mux.c              | 107 +++++++++++++++++++---
 include/linux/i2c.h                |  35 ++++++++
 4 files changed, 339 insertions(+), 24 deletions(-)
---
base-commit: 1f97d9dcf53649c41c33227b345a36902cbb08ad
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


