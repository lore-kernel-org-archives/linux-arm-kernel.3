Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD15C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 22:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9tetAXGJGm6WY4YSFyXOkWGhCtbJ9Cx/UiZBqb92zmI=; b=ihPuADR/dFQSwEbqI+gnkvUCEu
	au6CLDzLJ8PnAlMjuqtMRx3IQte1q0pa9iG85UxD1mScLCsmwZYKihk8TswvDlBBeZX2WpINw1IA1
	NFQ6ZAdFrHuL+0GjL1P6sWZYefq/kd9KK0rChvajrnFSrLOnEdm1BqcGSN+fc+voQ2F8Wkn9Jxpmy
	LcYXxSbFGV/Th5iZ+OKyh0rkT5WSsrFZeerzHYLQeBXwLmbixO6zSHPym+hmelQDtijdX2JdQ38zV
	MuPaEGSSocH1pfRxJTvV5P8P/PeOQNOjvXRXnv5SYF3NT4b7zFH2Vwr1ZSM7M8SD9wV0QZT6mbB8v
	XQmflkRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlYK-0000000DOkm-37mj;
	Tue, 14 Jul 2026 22:24:36 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlYI-0000000DOk6-2E4X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 22:24:35 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38175907a56so48957a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 15:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784067873; x=1784672673; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tetAXGJGm6WY4YSFyXOkWGhCtbJ9Cx/UiZBqb92zmI=;
        b=lWkWac5YfOo+Cz3DrYTznTCfmem+8Tjxe6nPv4o1odqla31vDBlja3aE9kOiA+zG/Q
         aZBeDWkIwmVbQEQD4dJAVVj7276/Vrp8lh3jbynAkybJuPlSBilH3k3LMI5NoO22WF4M
         jbk5scqpK1fkAGCLqHhBf4k7hJ46JKmbGUCCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067873; x=1784672673;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9tetAXGJGm6WY4YSFyXOkWGhCtbJ9Cx/UiZBqb92zmI=;
        b=dSV1LW1PX4LZ9UrSLFOI7Qx2Fgv8CjzQyqFWd5XTe10OaY7j3h2vrg1MjI0oYAxbhW
         QfdYzpbxXRYAaVlLdQFN5cQM1za9/OErAJFY4yMsKB+5sNT3nS/LiM7ydrSHSiImkARE
         LrAQ7GvRnzCVYadQpKTxhfiAqDxH1cZisU42nui4gKolzHlm/bzFWpCdWeC1iOI3fZZL
         bz3x3JMUiCEPEnz0nqXQPgz2pn7j78ooljCktDZQvC2FiR7f/IbGLWXJ78KP3P+bNnk8
         H0poXrBD/OcVgZA3R3VgeIOUJqyY0I0No0AYM4s5DgMrTeWCYNGp0N24RIzM4NHEzKVZ
         5geA==
X-Forwarded-Encrypted: i=1; AHgh+RrueJC9So4REwIS3PPML0TmbDq4xYhioMMvpVGAMR9eA9cscIF18AgQwHG+kKnZS+ZDa63mxWIC0+/ZGT/wq841@lists.infradead.org
X-Gm-Message-State: AOJu0YzQV43Uz5uJKnfLwl2USks3lAsUMzyfDeOk8sYyyQr6wPwPvL3w
	1a7U9EAJsXS8Q/0aiwg/2sQJ4/XLGgf+W5ugXXIYYOjJjRHrqQlIfieowgSec/cT/A==
X-Gm-Gg: AfdE7cn5Jb9BNGbsVau7UPtzyEo3yaxc+Z92OoLYveo0Ulu6OIO/WjVfxJgUlK0v0DJ
	GtkT2+gjfMOYiIkXviYe8h9DVaG9Gq6U9yRsoF8FXS/pHo+z/mpe3KRiosPfqkDVky97ylYjY3U
	WcXD3OnKlWvPBRCrmGogh8bsX4glbUc/gMhGb/PbHBXRzm2kBxVMfiqJ6z8B4oA+WIR+fYjIPML
	/mPrkvB1q8bbQdFwq1y+J/88oEaPo9T8jI5ab1lEqkDNlrFjtKe561o/lmFyghH9fiqRS++EcFW
	SU6pNWG2JWLL75p8/dXhbizuMUIOLGvoqXyCPwOw88q+p6M9SuKJpyPKnysd02J3yspeHRY2O/F
	hdvxwZGv++T5b3AR18Fi6mHtUHIXfi/JGBoelZvjWkPLdt+h7x9l6NMLEbKKBRs+CACNGFY4vJ1
	sO1cu5UsR+8C/gV22vbXZusgnyrysXgocnGvMUPenG8mpv0Dp2Uo8ZXm/tI2mvtGLgjoi0nQ==
X-Received: by 2002:a17:90b:4f:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38d13f5fb5dmr21455803a91.6.1784067873033;
        Tue, 14 Jul 2026 15:24:33 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:32cb:eed4:7c:dc87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm76540741eec.9.2026.07.14.15.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:24:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/7] mailbox: Improve the mbox core then introduce the goog-mba driver
Date: Tue, 14 Jul 2026 15:21:39 -0700
Message-ID: <20260714222338.2965707-1-dianders@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_152434_609897_5BF2B2D6 
X-CRM114-Status: GOOD (  16.29  )
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


The goal of this series is to land support for the goog-mba (MailBox
Array) IP block that's present in Pixel 10 phones.

As can be seen in the device-tree bindings for the goog-mba IP block,
the mailbox IP block in Pixel 10 phones is fairly sophisticated.
Notably:
* It has hardware features that support queuing, meaning that more
  than one mailbox message can be pending at a time.
* The "channels" in a given mailbox array aren't homogeneous. Each
  "channel" in the mailbox array can have a different amount of memory
  for messages. Really, the "channels" in a mailbox are considered to
  be full single-channel mailboxes and a grouping of mailboxes is
  considered a "mailbox array" (hence the IP block being named "mba")

In order to cleanly support some of the sophisticated goog-mba
features, improvements are made to the mailbox core. Specifically,
support for mailbox controllers that can queue is added and also
support for mailbox drivers that have more than one sub-node is added.

This is a fairly big rewrite from the downstream MBA driver shipping
on Pixel 10 phones, which awkwardly makes due without the improvements
to the mailbox core. It has been lightly tested both by porting it to
an experimental downstream tree based on 7.1 and also by running it
directly upstream against a stripped down Pixel 10 device tree.


Douglas Anderson (7):
  dt-bindings: mailbox: Don't require #mbox-cells to be 1
  mailbox: Allow #mbox-cells = <0> without specifying a custom xlate
  mailbox: Find a matching mailbox by fwnode rather than device
  mailbox: Simplify circular queue math with mod arithmetic
  mailbox: Add support for mailbox controllers that can queue
  dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
  mailbox: goog-mba: Introduce the goog-mba mailbox driver

 .../bindings/mailbox/google,mba.yaml          | 216 +++++++
 .../devicetree/bindings/mailbox/mailbox.txt   |   6 +-
 MAINTAINERS                                   |   8 +
 drivers/mailbox/Kconfig                       |   8 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/goog-mba-priv.h               | 108 ++++
 drivers/mailbox/goog-mba-trace.h              | 183 ++++++
 drivers/mailbox/goog-mba.c                    | 567 ++++++++++++++++++
 drivers/mailbox/mailbox.c                     |  84 ++-
 include/linux/mailbox/goog-mba-message.h      |  38 ++
 include/linux/mailbox_controller.h            |  15 +-
 11 files changed, 1209 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/google,mba.yaml
 create mode 100644 drivers/mailbox/goog-mba-priv.h
 create mode 100644 drivers/mailbox/goog-mba-trace.h
 create mode 100644 drivers/mailbox/goog-mba.c
 create mode 100644 include/linux/mailbox/goog-mba-message.h

-- 
2.55.0.141.g00534a21ce-goog


