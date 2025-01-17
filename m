Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E4EC02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HF3HtUtfAu4n8L77UWwH/wgG3K4qS3wA+QVLh+7nSzM=; b=HOQnLwavRudybeImod4lSgt34/
	Ugliy0L7W3i3/VypptaGE/xckY8LL7bnBkt9B5P7wnn2PYsdlOzAGzcXo08ctPJaFq1T3Jtn6Lq9/
	XD/+3jlXTYfh3bp3DZoNChgZDptmXz2BhhUSoWMZFR6WSATrAwdfrzBj0lnNZQvLkO8/L7anj6ssi
	S3RrcLlzyxz8t5k0Ac9ORqa+1ABF0EjSbbXgYatrAcTbLxBjcpE4MyH0D4zaleR3oqYR6O4yjowSl
	gNroybHqUA0idbI2PW17gB6+CDeuT07BfaOGYMMywnK53VserLKa5BZtjoVbeNGw2AeKHkemhwnd6
	X4gBpspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYktA-00000000BRW-2deW;
	Fri, 17 Jan 2025 11:51:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYkro-00000000BHN-25iF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 11:50:27 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53f22fd6832so2206488e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 03:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737114623; x=1737719423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HF3HtUtfAu4n8L77UWwH/wgG3K4qS3wA+QVLh+7nSzM=;
        b=AMadqb7ifxgB1idxz1xCkF0wgdnVCu8V44gEaO0kzR9eXVM9lqYXXgUGpwnXytP+XK
         MAYNrbmMPTTnN5cTLzY65qmZJiNoohrtc22COMPlJ9JLFchlbwgWJeE3hQfOV4kyCy1C
         Vw4KFqJsQaBAxtsvJG5jX8SwdOrrZnhtuh6/B2LRgwwofUwYBvesj96psS93CfQesfvo
         LQjrTI1b10j3xfM0I4CykdCrjSyn2VHd9ydErx4DbinhAr7r6nXqOPgrL/ZRNXOdGXnn
         yAxfZVlc1s996BNKCDogGD3l96HBK/CE7SQPubWf1ixOMfyyVpVY+inDQr4sIy8eAuRD
         1W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737114623; x=1737719423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HF3HtUtfAu4n8L77UWwH/wgG3K4qS3wA+QVLh+7nSzM=;
        b=WXJ5HxyLnMhuie4P1wdsvdDe0r1sU3kF4hUH0A0/seRkhw1dXRigZbdTAgBl0b7Xpr
         tvnNBO181azjrDuud1wl41bFPU2HpoSOS9e/WGuugKADINgWRT5pgCjTQB5aGzqLKAh9
         5Y5uydOr4S8K/4KihkMeuV5poaJQa6aIqJR65jV3SLotdwCNBXqwWNnXJ7zfWKfCWQu+
         j9LX63d+GNNcKooeouulxsJILyuEYhql55OwgXAOeOiBYWi6jGTY8FDNk9NbCQsGOSO8
         HIlCpi8rW7FubjmaL2BRrg24hiR79dcaSjQbgbaI8cCQjhlU2KeH/kJ5SkMHjX2EBn6M
         sGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi10eh2Ak+uZkKEC0SgapMhXmaMClzrq827eB9IhhNdM0qoe25zDYN2y8iUo1fh4JcohBlL85OmpoH22hRoA+H@lists.infradead.org
X-Gm-Message-State: AOJu0YzBX0YtgVBDoc/VfSmJHb5eRtMC7ByZL9Z4xyFID0CPemIi0EXp
	nrZqolPPn0JlBsz67XDHSQpQnxV2HSLUYKe5Q+iU28SNxBRQJycbtTHHMvfJWwI=
X-Gm-Gg: ASbGncsjtd77yjcZ1oIvmgUMNpwhgdYN3eJEhx4ZSMCvOvFchGCjWbfVWcUYqsqbFCe
	Mea7v/gbXju9M5rIoJIkTX2jV+0pbBqDOM+j7qw6rX7JiTcz/iBuuxyuNNXt5VME+RLEyRx57ab
	cF1ftn3VzEP6X4p30/26Wbf4VABPb9aNxcJytYJ7VwEPXZa6yoPiNRNfwfsPTyqZcA5hgIQysRm
	Jm5m8Z4EOmY+tmUxY5MQO1rOKSyO4HXhrjWKph8vNar8XkgmqHuzV+9Ul2RHtyuQzZTqXPGinUO
	tdvsSL73H5B1DWt5OrGyh2KWWsKQSKE=
X-Google-Smtp-Source: AGHT+IH1wnzOw14sjbF7dAPjH6ln1IxkVsiYQfGjuneU9oc+H1R1X98toJc2Q+PdXTyuw6himuwmSA==
X-Received: by 2002:a19:c214:0:b0:542:91a5:1d5c with SMTP id 2adb3069b0e04-5439c22cb3amr538573e87.8.1737114622431;
        Fri, 17 Jan 2025 03:50:22 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af72b45sm329764e87.179.2025.01.17.03.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 03:50:21 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.13-rc8
Date: Fri, 17 Jan 2025 12:50:20 +0100
Message-ID: <20250117115020.131731-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_035025_853598_1DB2B183 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

Hi Linus,

Here's a PR with an pmdomain fix intended for v6.13-rc8. Details about
the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit f64f610ec6ab59dd0391b03842cea3a4cd8ee34f:

  pmdomain: core: add dummy release function to genpd device (2024-12-19 15:47:02 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.13-rc2-2

for you to fetch changes up to 726efa92e02b460811e8bc6990dd742f03b645ea:

  pmdomain: imx8mp-blk-ctrl: add missing loop break condition (2025-01-16 16:10:32 +0100)

----------------------------------------------------------------
pmdomain providers:
 - imx8mp-blk-ctrl: Add missing loop break condition

----------------------------------------------------------------
Xiaolei Wang (1):
      pmdomain: imx8mp-blk-ctrl: add missing loop break condition

 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

