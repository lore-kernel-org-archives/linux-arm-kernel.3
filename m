Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336A8C02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 14:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LyLefsirnFHiBny48nwRg1v70yfpPBzd1WsBXD7eEU0=; b=1lhc5M0KtUqty0
	YqxiSqSNbun0hKtKdmHhKbxn5nrW9a5HSaSE2Gnijbm4/Ty+OUxvZMQZqe1lvsXVtxh2IhjGttpfu
	Qat/MVT9/LoYlmD+MCKmdN0gWDcY9WuUlC8vtE7C0mtpMT+PnobY7UYwQ5CX5o+Mi9hW4dtIDAGDv
	V/bpqLvs4HxflAReaNoq6u2AZoKy0kenvglB1F/PbAcuuG7pa2xtHLW4nyN45lH6pEeAL1a1EOMte
	1Ekg2e7i7ePPadYjHgswYJczYqf+YZYiw6DFyT6vnPgVbPHYrNcB3DaphYycpeniT+eYHJbhoXHhu
	wSdasxLrILvcHTaJSEAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4FO-0000000C6Fg-2nYK;
	Wed, 15 Jan 2025 14:19:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4Dy-0000000C5oa-2s9o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 14:18:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so69795645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 06:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736950705; x=1737555505; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LyLefsirnFHiBny48nwRg1v70yfpPBzd1WsBXD7eEU0=;
        b=u0KCNrje5mYTjwE8lLT/qCtzBmUAxfE5rEt7/GMEQjNdx+balxsgaG6+sFNnxZLJRz
         HvYkCk7EuKGTKKa3b6vCP4Gtstwe9pHJ9t9e4JnanDVTbomUbY5AYg9iYFVFXavVqFXJ
         dqsF4/DCKMGk4l4cYAAOsUg/38/8yeG4iDcTsIXulG+NxR3KuLh1U7GmRa7ypoEhcyWn
         MkMju4GXfJUWiLpYTHor4dBPoZn97f/IQfdDxDNRRDwsmOiU9S5JgC8WlviWGnr1mQIP
         HGvVygxmSky01R98R4greWBBMP9j7famIwN67QFB3L+W+71x4QsGCyWuX/Wmyxz+X0Un
         D65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736950705; x=1737555505;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyLefsirnFHiBny48nwRg1v70yfpPBzd1WsBXD7eEU0=;
        b=ltRPLhjuviZ9yCUQprqV4q2emXwFlIWtAwmkwEthsuOr2wyOAVWR3FADqkdW1xWk9R
         EpIBbEZzR1GjLhFWxmz5eeSL4d4M2w8QbCK4nlnOWXexao+frCd+tfurk9cmjwd2g1Fz
         5K8uAkf9141CnuPZGYWHeNMK9QppGEBfGmq/2Houmv9rVuEx+2jtVKifNjEubwEanHnR
         gnrvkfZX5dPVhl3YV5whcSHWpRoTWdu7n5jNc+rS+H8C/mSZDtAl83UHME4PuJZskooM
         bDznvdCt4XagclhGsbQ/tW6e8NmbdA2LZY9hdYZjFXrmRl+1p4XV6RYZqUVPp2lYzi1e
         cs1g==
X-Forwarded-Encrypted: i=1; AJvYcCVhDjOhDGoHwVTX8ukZWhbrnzYPGSANeKoM1r3C9Y/saZvqbEyY4TtA4yuXr/XRx+44eJZJRljM5txPkm3knCHy@lists.infradead.org
X-Gm-Message-State: AOJu0YwAvWjFpMdP9VtxhQwDYODYF8o47K03RiAIZqJneWBJUkOqTWyD
	3u/nZZLQI18A3DpttBxwFDEB9BiWDUXubHZBpILTn60dSXuEZwQ7nOuKqbZPCZE=
X-Gm-Gg: ASbGnctPU0E6o9EQYzV2B02eOPKPIrRWhc4q+YOAdObq1p7FzD+f2YVrzGHmLTkp45j
	KSVT14h11E1/UAYgMyNr/QDuztC370CK1Mlb5q8YusgHqVj8+Opb6hBIlYyQfhflkr/KrH5P0tt
	JQbYfzQWVgPjsqPMywgE1LxYuv7udcaO+xcwKtTMcBniUmthwSFDnRXBRTUDoxbFNqvKaWf99k3
	9ElERl/ub9ylsuGHSOoJLIqorhilLsevo+VtGK0PRLvl+iZNy2RJK6Yj0yDCiXUsr/4AQMyrVtf
	6M4GInVBCfB9USNm3UAwLEZ2mvijGi1yO+H2
X-Google-Smtp-Source: AGHT+IGP60LUIuwASgS9o56h7S+gPKy3P6BFhKHpsGSUmfHT7ch3g+Akxa/OVdsuqoBRuhChB68dWw==
X-Received: by 2002:a05:600c:3ca4:b0:434:a10f:9b with SMTP id 5b1f17b1804b1-436e26ab2a2mr300078595e9.14.1736950704653;
        Wed, 15 Jan 2025 06:18:24 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74d8e06sm25184555e9.31.2025.01.15.06.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:18:24 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v7 0/3] mailbox: add Samsung Exynos driver
Date: Wed, 15 Jan 2025 14:18:13 +0000
Message-Id: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKXDh2cC/4XNTQ6CMBCG4auQrq1px5YfV97DuCh0Ck2EkhYJh
 nB3CyuMIS7fL5lnZhLQWwzkmszE42iDdV2M7JSQqlFdjdTq2AQYCA4cqKr6lo6CvvoweFQtbUs
 30ULkGReMiZJJEm97j8ZOm3t/xG5sGJx/b29Gsa7/xDgwysDkGguojDK3p+2Ud2fna7KSo9wz2
 REjI1Npri+F5AZz8cOkOwbYEZNGRqWFgJylKEF9McuyfABK4qjrSQEAAA==
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736950703; l=4681;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Ra6VjKu0S3TSfrpyZV+gMCodGc+tYkk8uce5ZVbjZAk=;
 b=h33+NfDQmI1lYuSRo6dWA3xcKVXDp8zt+ua3vNaiqopS3831SKpnkgpY5JbC5qMvfYArvfzDr
 Nb5gwIHttynAIeGp41FEsEx44XfnSP20eo86RQivF9H0/dkFeiJEri+
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_061826_751582_838B0E93 
X-CRM114-Status: GOOD (  20.47  )
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

Now that the channel identifiers are passed through 'void *data' in
send_data(), the clients now depend on the message format introduced in
include/linux/mailbox/exynos-message.h. If Jassi finds this set fine,
then he shall provide either an immutable tag so that Krzysztof uses it
if applying the ACPM interface driver, or to ACK this set and let Krzysztof
queue it.

Description and change log below. Thanks.
ta

The Samsung Exynos mailbox controller, used on Google GS101 SoC, has 16 flag
bits for hardware interrupt generation and a shared register for passing
mailbox messages. When the controller is used by the ACPM protocol the shared
register is ignored and the mailbox controller acts as a doorbell.
The controller just raises the interrupt to APM after the ACPM protocol has
written the message to SRAM.

Changes in v7:
- driver: pass channel identifiers via 'void *data' in send_data().
- bindings: drop chan type definitions - not used in dt
- bindings: drop comment and "|".
- spin-off dt-bindings mailbox patch on its own. #mbox-cells = <0>; was
  already allowed and used in brcm and mtk.
- refer to the ACPM driver as "ACPM interface". The interface uses some
  protocols (PMIC, DVFS, etc.) to communicate with the ACPM firmware.
- Link to v6: https://lore.kernel.org/r/20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org

Changes in v6:
- mailbox: add support for clients to request channels by arguments.
  Used by the ACPM interface where the channel identifiers are
  discovered at runtime. Passing them via DT would be redundant.
  Initial version sent on its own to gather feedback:
  - Link: https://lore.kernel.org/all/20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org/
  - the patches differ from the initial version as they allow #mbox-cells = 0
- bindings: google,gs101-mbox: update description, make #mbox-cells
  const 0.
- mailbox: exynos-mailbox:
  - replace exynos_mbox_of_xlate with exynos_mbox_xlate, the channel
    identifiers are discovered at runtime and passed as
    'const struct mbox_xlate_args *sp'
  - in the xlate method, the first argument is the channel and the
    second the type, as channels can be configured either in DOORBELL or
    DATA modes. This becomes an example for when an exynos_mbox_of_xlate()
    method will be introduced.
  - make exynos_mbox_chan_index() inline and directly
    return chan - chan->mbox->chans;
- drop Krzysztof's and Peter's R-b tags from the google,gs101-mbox
  bindings and the Samsung Exynos mailbox driver as they were updated.
- add Krzysztof's and Peter's R-b tags to the MAINTAINERS patch
- Link to v5: https://lore.kernel.org/r/20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org

Changes in v5:
- fix dt-bindings by using the correct compatible name in the example
- drop redundand "bindings" from the dt-bindings patch subject
- rebase on top of v6.13-rc3
- Link to v4: https://lore.kernel.org/r/20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org

Changes in v4:
- rename bindings file to be based on compatible: google,gs101-acpm-mbox
- specify doorbell or data mode via '#mbox-cells' dt property. Update
  driver and introduce exynos_mbox_of_xlate() to parse the mode.
- s/samsung/Samsung/, s/exynos/Exynos/
- use writel instead of writel_relaxed
- remove stray of_match_ptr()
- Link to v3: https://lore.kernel.org/linux-arm-kernel/20241205174137.190545-1-tudor.ambarus@linaro.org/

Changes in v3:
- decouple the mailbox controller driver from the ACPM protocol driver
- address Krzysztof's review comments

v2:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

v1:
https://lore.kernel.org/linux-arm-kernel/20241004165301.1979527-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      dt-bindings: mailbox: add google,gs101-mbox
      mailbox: add Samsung Exynos driver
      MAINTAINERS: add entry for Samsung Exynos mailbox driver

 .../bindings/mailbox/google,gs101-mbox.yaml        |  69 +++++++++
 MAINTAINERS                                        |  10 ++
 drivers/mailbox/Kconfig                            |  11 ++
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/exynos-mailbox.c                   | 157 +++++++++++++++++++++
 include/linux/mailbox/exynos-message.h             |  19 +++
 6 files changed, 268 insertions(+)
---
base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
change-id: 20241212-acpm-v4-upstream-mbox-948714004b05

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


