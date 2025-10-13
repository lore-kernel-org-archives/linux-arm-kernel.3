Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E03CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUB0zP/a55S1pa9D33iQN4CRyeUZ3bxGl0mgNYJShCg=; b=tPS9KakGgqgi502PUO29bxr4y1
	xSFXwcq3FOtQcgRn131Nvp84mVSkc1M8ly1QTZGFrGcxzxiUkQj+o4i0EmLmszzLSK4PW2c4f5BQA
	ot71OMGM2Ic7aiJbrK/7EJSk+00bEn3h+bFqJeMpHtaaysARyOR0U4MY94GyiWS/63tces0V8pMUB
	Sb+nbhGM3n+QBf4HW3/fDzVVx4/jNvS3odxnwllxyJJYaShqzTQ/Xn0Z/Y0jbYp8Glot+o9SUSGqk
	Rqmi/PG+336rdVoY6dfiKlA4IfmXQAyQqnK6hJZNylBQfvnig1CHNDfZ+scKM8Zk3GOXAmI7aut7O
	D1pbnWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoS-0000000DFX2-03HI;
	Mon, 13 Oct 2025 13:42:08 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoO-0000000DFTL-0Cla
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 13:42:06 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-63babfdb52cso1527250a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362922; x=1760967722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUB0zP/a55S1pa9D33iQN4CRyeUZ3bxGl0mgNYJShCg=;
        b=GB6WOlCD81y2M7lvQ7CKCsej5DHk2Tf2zWQ1onBSPOOKUnz4l/Ijv8s0uyAZOFy6Fp
         2Q2+oR96jnsgWxLYMHH7BuigfF31mtfIa5d3rNQ3BtiwBFIOwyCXU0b+LufwJoC33HaP
         LyUN/FM4VDnquhR/S6tjE7UhnJb8/J87qwb/mOKY9LsRsOhU9KkQyxocjFALqhkTdkN6
         X/zKJ7vO0C44lCLyO6eIfs8+Zo2EKjgfOj+CsslG8TRZQKHflEqjYbPADOhcn8ReBDOs
         MTCS4cs0nlpGdvI/1knTfrE5rLD8RW2xYg/uEA+WrqqHrN9iz48PlrpgTSRSoVHN4+1x
         5ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362922; x=1760967722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUB0zP/a55S1pa9D33iQN4CRyeUZ3bxGl0mgNYJShCg=;
        b=e8ps59KqQu6vJpgcrL4GEb75+snbGINOQepp35a7G3dd8Nw8CwXG9ps5zqz6bX+2iw
         RyKpvA1M+L5xU3+MAGeHUzecFJGBs/e6JmY81OXAWeG3xQav7cA+9esSz/6shXupGimo
         N5XowGXeZcmUN5VLpE28YlDyB2lvrNNlmDDqUBJJ6VhR5YWsmDn2s+5pi5T6L0W3eM/a
         AyaRD90xKv7LwbPFhMVOyLm2xyrGvLUqwarjGZ+BV6u8DI/DHGe/5DzZP5TqR6utzEzQ
         52Sqxa4IaNIMMjcfhLeCcflwcYoURjKy9Zv4RUKKcHm8chUDKr7ohYvUt9H4km9Omt42
         /rHg==
X-Forwarded-Encrypted: i=1; AJvYcCUN+MTDCvXANIAFsK5rJbokeD4LY2IHHaPgE9pAVD1xVn19Z8O1GOX0+ayzphN/7S91d0P29QM4ON0cxp9fFWdG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxus1uc1aHMXMkwgwoalUNrNr0nJjf1LiV0kt2vNnvI8VjWkJUC
	6eGT2eVGSxpKPDtISUFSa2Q0EizwdbeBbmURMFRLbOz0fkQfIR3sB9Dy
X-Gm-Gg: ASbGncsfwrDPl4j/xKOLSiKRzdmjhcQpwxGpkhxIyN5CRjQXA528tglgRcDp2G/O0JW
	tYQE2e1GsYBNtOnMswXDvPGYp2iIy33zT3zoUKXpfXKGRRgKyIahDJeBq1yMrLxAAsSgTO17j5N
	qOrNeiVwfOALwaERX+HUZxLstC45E4UP6mxSz+96JvGwtKZTzvvaZGBCKqdIeJvKvDthdwEFnb/
	sNmyugwA8DXXxSQzhgUjxutm6+wzsPyStcer+xkKUFYU/g4jCPbx2xFhJf5bdofIaWFEkmHbt9X
	AP4lWWlmlHQOLcFusJgGLyZr4fEUeKodp+NhGu/2Q+cyS/2qJUGdQ+8AnNldEEXY8/Rq+GraGh7
	IRlev0+9koJIdOkXMd7qntIf+VqF+O9DaGUkDUvs+LK7EBxyz3/fX/6YJ0gTZN+2PtpyBl3cgRi
	AVf7A7MLb1Hd0wp2CjbbwZFyM=
X-Google-Smtp-Source: AGHT+IHqUc4fx8LUFQZ8hvav+GM1r5MA2m3puQngPSAz/svFdWdEv+ZFSFoy+G7J6JLulAFjEXGl3w==
X-Received: by 2002:a05:6402:350a:b0:639:ff4f:4bc3 with SMTP id 4fb4d7f45d1cf-639ff4f5019mr12949247a12.4.1760362922068;
        Mon, 13 Oct 2025 06:42:02 -0700 (PDT)
Received: from tablet.my.domain (83.21.75.22.ipv4.supernova.orange.pl. [83.21.75.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c32249esm8729019a12.41.2025.10.13.06.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:42:01 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 13 Oct 2025 15:41:51 +0200
Subject: [PATCH v7 4/7] clk: bcm: kona: Make kona_peri_clk_ops const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kona-bus-clock-v7-4-8f473d99ae19@gmail.com>
References: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
In-Reply-To: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=vh/hIeQB05qjlIgWDhfjgy/vwvluYj0FXcfCExT1EEA=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBo7QGgLIh1OotbM02cBSNImXPm94eR/rNh7qr71
 hhNVhx47+WJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaO0BoAAKCRCzu/ihE6BR
 aIC3D/9CxbU4X9eZl7sCJWQeJfaKDgTtg3p4OPDgGQH4OW5X+rcW/olUGRpjJ8i6+7lS+r2Mrc6
 LYuT+TdS/jgYBfs/F8bWeAfyi/YqvGZ2dl2JuSNjb/Gu8F2FQsLBF8qQmvyHkT+NvZ+nfvA8sow
 7hhA7Pfsw+VjX4DRa4k91qrXgRMks+pKfS5/adZW4R+Dn067lgEbSF4oQec66elLUoItwxmg6zx
 gkWrvmZIYYbITyBRT3jCP3Vo69xP4sqlp13L3B+YklzquZghPbUaq6QBF4DuprXQxFrBFfMPTmO
 sWnVrtbYzhW8TfzkvuNVsc6BX2iH2Mbd78jaOn5c7cdZWO+YtXL1LUS0TaOh9WnBhIArgQ3jbWj
 PmBB59h0OFBD7GkZIp94AG1iUL7cQAMPIRoLQlPDxjDHYigpy6KqDyGbHG3jMJwk7waTY7R8eq4
 pFQCPpRmbgnNFS1AYjz04+W6zMJpHeuk2vXwjeQDYSF9PWE/d9b8q0LB6yGgZ5svLQk6dQKeWfu
 fkjOJbPiogzhMlClRu9X4mWBZGUmz95zxKq6AaQFpd5k8SkUNZhLjReh5sEjvJsg/g9+u1Tx2+t
 auMPAxhhQpfQhoua0mH7qn4MUhbuAfEGuSGpwOwMvv91fEf+hx/4q81a051Ndn4L6YwQN8PRVsZ
 89nyZL6D4wZBjuw==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_064204_115320_BD6DE1B3 
X-CRM114-Status: GOOD (  14.76  )
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

Fix a warning raised by checkpatch about non-const clk_ops by making the
relevant struct const.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Add this commit
---
 drivers/clk/bcm/clk-kona.c | 2 +-
 drivers/clk/bcm/clk-kona.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 0171e6b2bfca..2641eaa4ca52 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -1154,7 +1154,7 @@ static int kona_peri_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-struct clk_ops kona_peri_clk_ops = {
+const struct clk_ops kona_peri_clk_ops = {
 	.enable = kona_peri_clk_enable,
 	.disable = kona_peri_clk_disable,
 	.is_enabled = kona_peri_clk_is_enabled,
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index d7cae437333c..7064ce316981 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -487,7 +487,7 @@ struct ccu_data {
 
 /* Exported globals */
 
-extern struct clk_ops kona_peri_clk_ops;
+extern const struct clk_ops kona_peri_clk_ops;
 
 /* Externally visible functions */
 

-- 
2.51.0


