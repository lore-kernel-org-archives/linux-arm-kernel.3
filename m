Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE8DCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/FtP8QfYvdqSZuTV1DgfaQnem0vOH6RafKPHcaYLj5g=; b=2VHf2Gb2/NnHBd
	Da5Gv5FhoAB536PqOBhk96UG/ai5UDmxHYu53bsG47LdGwrjkLu6N732VmaOePgufw52LmGHIPqMG
	zR9PMVvW6/iv9oIorMW+Drro/tW6/cmbtrFIMAdLOfdxecYYwW1TmqbZLI4FFx17o67MCIgJglkqP
	jdBauANR3HFf+UtFHs7EhZD6EU2IIxUkZzJ4cWXdKe7tnFNgVPmspHK0WzR224DbwMdVk22NUwwWB
	t3u7seKcuf2zZf8JzBi6+SwhD+xpMcTjzjwoz24qXEFryZ4eIgJn46Tgqvo0tzF0J1uUXbU8BusG0
	hdmWzn1p7gV1mfPSFzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEzn-000000017fU-1rPR;
	Mon, 28 Sep 2026 17:18:31 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEzk-000000017du-1SjS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:18:29 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso31452905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790615906; x=1791220706; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/FtP8QfYvdqSZuTV1DgfaQnem0vOH6RafKPHcaYLj5g=;
        b=TQ7zfIyR/LLz6HJliZoUxYB4mbcXavmRhdzUfZJmWj/MajymEombcIOH5t529yYxyM
         H1/mfusu8IGVTsSOYeVdwUfDkjyeQAsu/bOI3ptWwYMuGeFfwwdtZxsQlFqAaHkAOykN
         8q0LymOQeXOx8bg/K1bnLZGGzbr53K19HyvtcVsiIu99ukvTnuXGVoUfP0b0Ef0fezfs
         594Cf/yudYTbXuGZQTkCLyt1zIJRKL65FtmrSbt6WKB5o2kqBvscGGiicFgM8W2ttY5S
         i+CyfDnTupv3hlbXwFsU3UJxW8q6cMLMeXes8Qk6EYfZc177dK4GCOg/VcaQL2NWvQum
         +GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615906; x=1791220706;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/FtP8QfYvdqSZuTV1DgfaQnem0vOH6RafKPHcaYLj5g=;
        b=k15fRvnsSWBMG9oILYlfXcQFZvWRd5uy3OaT8FcxPwSVKi4LBmJy5DZX1L39Q7pnav
         hj5fEI7dqt1MSOvggO0MdogiNUPFeAUKVf808lUA2xzWuJDevrT6kYloQOFkkIDat4ae
         VbbMcdBOc7oj6VwHo5+DvcBWdRV6U2LubdViiVlSTJxXj7wzqu+S6CewGpGIgE+jw4Mx
         CXPAYTlv4eeMCp0T/V+n0HlfxBhXERxzRhQHPQqyl+9gZSWohFl5YE7ZAJ9I+2Odul3l
         3g20CEerMDHXgJGNHqDFBzIZxgXnJeIZhaVjDc2AiqhklckfwiaEHrTfVGcSPSrV6FF2
         HpnA==
X-Forwarded-Encrypted: i=1; AKwUvByyeOoEvRrFZtPaoqrU8767Qyspau+iC/V/L9+f+ZDD2bNnwEEwxIR411c32kCmxZ3wI7vzKJYPj7xXsgrAh4Xi@lists.infradead.org
X-Gm-Message-State: AFuF++koFH1sg+y4lPEBtqLn8IpXtkklnsA++TbnOFBzvPOWffN3C28u
	pbyoluRKXBCQp4CC3fkDRpoohhW7rcw/o8ceGjgGFFqTn+zBw73OUqQI4Isdb/RkXQI=
X-Gm-Gg: AYBFou34JhPvfHTUOZpaj+ethiM9Ml2ATLZYKEoET4OpOvp/wrnnqIH0+hyLD1/mVE3
	uCwgd4CwvSv65U2+qidX9/AL5oaVuqcyUGJlXH9fHc/+wqXufz+BX47uAQLM7mCc0gRxqzByvJQ
	P7249P9kjA6uN/j6QSwzi17r0W0wbvdDJ67gyatLE0rPoDqMO8G/d4JjukRZr1SkIgt0Kh/oUu8
	nbjBjlssUVimANsPdDPNu1Yqzm9lh5LsYolO6EBdyf70snph+bOHX3yv2vhePgioCYXbPdlyZQj
	840mEZIoPDJYIY/v48Az/nOvdr0nWWjGWazkwQHUqjEKVrKuIYf3rsaifFgV/ptfUAnBtwWpOrn
	ZYYmam4BGVRnqL1am5saqSTMB64LsR9gb6wlowbY93FjAqM8NA+vvMLeYrIfThZJOQAxg0X0bGb
	QyG3g7RDDgs/daDNpkjZ5O3xnVeY1X2XqwVooHhEeHEBM9aDoJNW9yeRKDoHscfCc3vbDe6+fKh
	H178dQj5EzsimcI
X-Received: by 2002:a05:600c:1d1c:b0:49f:bd3c:bc28 with SMTP id 5b1f17b1804b1-49fe6712809mr247163255e9.35.1790615905740;
        Mon, 28 Sep 2026 10:18:25 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm29224973f8f.36.2026.09.28.10.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:18:25 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/5] power: reset: syscon-reboot-mode: Add support for
 Rockchip RK3576 reboot modes
Date: Mon, 28 Sep 2026 21:18:15 +0400
Message-Id: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJbSuCVzEuKP3R0UjJFA0J4
 e5WXX6L91bKUEGmU7WS4i1Z0liw31XU37rxCpZYTNbY2rS24eBZH+5wrFkRUpr5mSI4usZ4uDY
 OxlNpJ8Ugy+97vvydX+GOfv7OaNs+19H5QHkAAAA=
X-Change-ID: 20260928-b4-rk3576-reboot-mode-d3804e39df04
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1836; i=alchark@flipper.net;
 h=from:subject:message-id; bh=s/mTlAGn0bObuTqVrR8xDe8Fg6yt56YXK2In/CNgXbE=;
 b=kA0DAAoWsqLYjxBZ1KUByyZiAGq6oV6iNH/VmmFzlQ1hQhAYxvpamHsdpOIQq94PE4kcQtNIB
 IiRBAAWCgA5FiEEnfakPZUyDpq6SEj1sqLYjxBZ1KUFAmq6oV4bFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJELKi2I8QWdSlvdkA+wRRO3lgERV5W1lHYPI+DQvpFJPuu/7czqqt6XFZwTG
 PAQDw9MHAy9l+53NYrKPFyIz2M01jBJjFuVhK7mB7r8c2Bw==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_101828_427392_D77188D5 
X-CRM114-Status: GOOD (  13.51  )
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

Rockchip RK3576 supports reboots with a specified boot device priority
mode, allowing one to override the board-defined strapping config and the
OTP programmed priority setting.

Supporting it requires several changes though:
- The boot mode request needs to be forwarded via TF-A to the boot ROM
  (upstream since TF-A commit 2a97ba20e901 ("feat(rk3576): forward any
  boot ROM boot mode request on reset"))
- Some power supplies need to be kept active across the reboot to prevent
  early boot code from running into a synchronous abort
- The magic values for each of the supported boot modes need to be defined
  for the OS to use

This series enables the above with the RK3576 EVB1 board as the example
user. Other boards will likely need a close to identical change to make
use of this functionality, but need testing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (5):
      dt-bindings: soc: rockchip: add boot ROM download boot mode
      dt-bindings: power: reset: syscon-reboot-mode: allow supplies
      power: reset: syscon-reboot-mode: enable supplies for the next stage
      arm64: dts: rockchip: add reboot-mode node to RK3576
      arm64: dts: rockchip: name the reboot mode supplies on RK3576 EVB1

 .../bindings/power/reset/syscon-reboot-mode.yaml   |  8 +++++
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   | 16 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 36 ++++++++++++++++++++
 drivers/power/reset/syscon-reboot-mode.c           | 39 ++++++++++++++++++++++
 include/dt-bindings/soc/rockchip,boot-mode.h       |  2 ++
 5 files changed, 101 insertions(+)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260928-b4-rk3576-reboot-mode-d3804e39df04

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


