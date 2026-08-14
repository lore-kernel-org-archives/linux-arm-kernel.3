Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99431C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jiRDm4IQnhuQ7LPoTTfQGjc9v5HsytEDBpwNIg9MWYw=; b=gzKsMkmQyD8Okh6IR0wjjyFmcF
	fpDDHNkd4fIjKXhvyOYs61wRDwQqOcU7dae4xSs9353lZOEngirnusTUooTjIJynQ46AqqbQ9kKJe
	49KGZd4fI4yAK5UiYQcH7NrmT4hfOrexFlesu39Oxdk5VSJYyOI0UrrkhxdnenTERCzJN1LLcM9MZ
	Sqr30bWI98RIdzRL3KiShck1rHoaxt8cO8Xo85TsqCNHfh8Nl1meaSpccAA4U38/pyYBz/QJuOLTk
	IlU1be43pnPCjGZW3WXyAaddPj4XBfKAXAvbAMVxkGAdGCucaY/2s9Z/n9jlIm9T8T328iFLz9ngs
	908DIhZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wussd-00000002n3y-3qq6;
	Fri, 14 Aug 2026 14:27:31 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wussa-00000002n3S-3ZU8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 14:27:29 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c16111a9b8dso10353066b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786717647; x=1787322447; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiRDm4IQnhuQ7LPoTTfQGjc9v5HsytEDBpwNIg9MWYw=;
        b=JpenBmccWZkojGG6OJhMvWzB4dGvU4OV2DNvHNYz4rSNzf0bjsiL+oetz0Y7nIXtUg
         ZFiY/Mlv0TvWIna0pXRpsjQKcgGHuZ3aktC6kkSrEjg94mtC52fjhUe+DmPFwGehkdaS
         cOn0/p5krEOGhYEBvrp5eIb+9acGNWw80QCUNWb6Z6D4XRQYrW6ncVvrrHV0qHlhRQHv
         SFLa9VRihlVoRGNhbGmPE2E9HUbdh+wC04DzdqeBP4ebtL6SJ0tUAbrv8sQnl6Msu37h
         PiQrUUA+aukrL0IbQ6gqOuFgJ77/VDE3hc8PwnLpiL8vCHzplXikMREAJuHyX9ApS+qA
         KPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717647; x=1787322447;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jiRDm4IQnhuQ7LPoTTfQGjc9v5HsytEDBpwNIg9MWYw=;
        b=RoPXgbBrdvIf+NAz6kkqz/njVmWpnNifbAiG7FZMhjEj9xvVg1iyqYp2V6pJ8lhigA
         lUDeGufuon6fNB07K3R3YZXfgZo0WJrcG6Ccmo6nlkIxTbLCL+d7JoLzEW80BcJE9KIK
         1BXXDUTwEllKamWIS+hUiK/oZ3B63c5xbNDewm6sTd+Jym1M/FMWz+ueIOqtQhHBOQI9
         uQn1q4zvRiq7KnmGEF5rbbiZQ/cWroxheljApQkvukZLdaIV3a85vJIdns8BWNVD5P2v
         kRdY0fp1MpaBOqfi2ZHIGB+MXJVQB9FQv5/ng/QrciaQG22hh7hS/oBzDEsfiHSPSyge
         m56A==
X-Forwarded-Encrypted: i=1; AHgh+RqmxLG1GD+/eU8eac5Y0LsKbTiLuSTknpzQLOdvMja8a/kVH2Mo6GcqbshlOppDQBM1x6J/ISaonWNvWCrS1+1v@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9g4H4gYDFtzJd/r8Ux8vYQyPLJLijhl7i43op8b8fLcsjO9/t
	yLYAZtVawSds0MTl1UAAqh4SFe5SmmNW0u7mJjrYSEU4m40YFFoWS1NJdC1F91Z28Vs=
X-Gm-Gg: AR+sD12fkjlC27K0eKwvJfjEhiJtQS/dyDBWvAha67zj2R5Fs0Z3C/BlKwOUHPSrE13
	ffUH0r51mx3g4VoO2vGBN2KH5ckIjTGDVqSnDLq8MTmszChvrufBrripEH2XisPjWSFaWJB0A5r
	qwduR9FUBE097tbBYAS5wTKN+yI2JUJ4XRTna8pv4oiQ8TbXo8HMhQtmaTabfMhQrnsa0pPDgQm
	wLXfI71KYRSorXun9F0PiA9P4TQM2vCEwpQE+uEuOeg0SuG8gUiZ4dvYPbYxC6l5QgywNmnOwkR
	0ai5UfCTX/LGp7qtBpBuMQm8uuFaHehJgNfoMzS5LK7gevMzI/h+u5OAlz8nciI0MRbBp0AlP4i
	z37Ny39FlWId+K9fbokWqWanrwHNIxjLr0lVKY8Mu5xwsHkINMwZ8jAvnH8mfZt/SSZZ2ItoQM9
	Uw2pkIYuv5Ket9HUmn22aRUPZK7C5HNaJU+H0+HkBAznZfBvTLazAoBbxPoN7PC0zCSAKCYbPCX
	8JfStI29Yp6Dav/Z6kojb5pcDU6aDRJDaYwWNhqgq1cwFLBYmgS1vhjSA==
X-Received: by 2002:a17:906:4fd0:b0:c12:927d:a288 with SMTP id a640c23a62f3a-c2129b1cc3bmr136866666b.1.1786717646762;
        Fri, 14 Aug 2026 07:27:26 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234c45ffsm106308866b.19.2026.08.14.07.27.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 07:27:26 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>
Subject: [PATCH v2 0/2] Fix two bugs in the DMA status path 
Date: Fri, 14 Aug 2026 16:21:09 +0200
Message-ID: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_072728_900844_FB330317 
X-CRM114-Status: UNSURE (   9.42  )
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

Thank you for the review. Patch 2 has been updated with a corrected
commit message — the original overclaimed an oops; the fix removes
undefined behaviour but no memory access actually occurs at that point.
Changes in v2:
  - Patch 2: correct commit message to accurately describe the undefined
    behaviour rather than claiming an imminent null pointer dereference

Christian Lugnberg (2):
  dmaengine: sun6i: fix non-atomic read of DMA position registers
  dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status

 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.54.0 (Apple Git-156)


