Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0825C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 22:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POBb41hMSzY1caDEN4VAGdVyeL6t9zbft7UqUCEzIuo=; b=X8DhuZnx0je2gVVourJB0ak1PD
	x2ZU3u8Z5ODMNgOgoGavglrynbcGeNjr3hn+KTMrJIdt6Zyv+7r+57US23tHGqX0RayZPiJA0OQWr
	8osoeYjV3J+u46B8xsicXEZu0TrwVo5fz28Cf11+QQ5BetTzmyLbklbVTtR13DznK0S7rU8VsPQa1
	S3IYx3brepKKEx4rnZIqPO2sFfSs4ef6nWIVBxDSukIQnFKD+fqU5v1esz6a1uFspKoHpUky1peQh
	xdAHFkitsW5DRwkej9tnIpN84xDY5XHx1n2Fmn/MlTr0PUOAMBHleBq5GZFH400v4yHsJVlTAVCpH
	G3Wb48bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxuKp-0000000ErFP-1EjZ;
	Sat, 22 Aug 2026 22:37:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxuKm-0000000ErF6-29g7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 22:37:05 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ceb096e675so26093325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 15:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787438223; cv=none;
        d=google.com; s=arc-20260327;
        b=fj2kmBl6hC9ZPrXNVWGHHpL8NJMoqBWv59ZVWLTT1BF8mK08pRH8RHh9I7Z1cu5rFu
         T1UwYHGjNkXY+bItwvAgiOfZF+nFHIxWF9dyUxOWNYKPYp8swFhCzytz1RPquNngtq1A
         01XA3AqaQ11xPwO6NugPMI3A5pE6YX7DQQu98CVmyQE9nSAh1qYfI1O8FLhZ2kyC6Wnz
         lBH/MMe5YfJ2vpAF7oZ4zje1Ne1bH5frRBlb1cv872tsqLKSfFDuD5a/ZX+Fumrz9cOi
         Tx5ftRDa6scNghEwo6a5WQgbxaRt1wZSuZSIDZmcz7L4iXf5ImFXWm9KFm7FmF1w4PaR
         3L8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=POBb41hMSzY1caDEN4VAGdVyeL6t9zbft7UqUCEzIuo=;
        fh=R+2egKqtqEPgYNqgFnH6d/AqACw6jV+PxIxeN1RM+WQ=;
        b=F52lRtnGi7tJig8sPnq+05hHRj1nf9hpcdm1yEt2gMQrAVTTn2rGkYuKTgf59wR8vW
         3z5YmxWsW198aeoJ9uqF9EkT5n7HBd3ErJGoI16A1CL8xY1fHhwDJcY6a8pIU13DpqV7
         qqtZRDaIVnyHZG2bqLY6XHqXT5ezuY0MzamHrzBHI+j1YnTChVvMi9Nc+v7ZmITAm3So
         wDRHthNqdZtZKkSXOVpscndeejNILgXlw8WW3gbdrAMfoEFOWxVLzoxaET9akLQ1Onfo
         Mc4WYhqSfsBQcJyfyW6UjlF/MryBO/hWfTTBF7hhGqhI+knQp2fiuOtqB5SNDMHOkQ3X
         48mA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787438223; x=1788043023; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POBb41hMSzY1caDEN4VAGdVyeL6t9zbft7UqUCEzIuo=;
        b=CCVxm2OelitIDyUYQ7ZOsF127f/7SiAJAF97F53Zebo5sjFFu/IEEprvb2DKNjd+Hj
         REWKsxXg6kXQaYlk8or/xvMMYii/NDpjvk8BTncLBKZq7AFcLlB8Z+uuNSOfkcGtq70o
         Pspj9HKF2yQzeGjbk2WxNi0p2hHPNtEJtWNQqV26jofcu+C5zgskd9dCtVZkyy5tT7oL
         S7Rt1cYVwd8I3N/CjxTA8ER78rkWmn9gUuZqxEVRQHn/7IHL54QTgJoqf98c3mQ31lxq
         88C+5nQNfF7EgglkxiKmBnl6hADqY+gg6j/0MI6uYAo2XQT4AfNAtedFc/M2pRfM7RMp
         4WTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787438223; x=1788043023;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=POBb41hMSzY1caDEN4VAGdVyeL6t9zbft7UqUCEzIuo=;
        b=WtoIe6Ak5EU3TgU+fqKTU2RjCCwTRfy4BtipOC7TLgtPEQqhXrgpXTUWySsb6B8ecj
         rAyLE9NxRnCuRFURclmSPFI/fpNwYgy8Vn+K6x4wp/HZ58Dzh21K8+OMK7akJyl6x3pq
         ymE/TNN+nlSeI7KtnYzTjAP5NTfsn7rua6OdJHSBjmRVEWfTpWe3S+tyEPzbARYwT4u+
         bcn04gH2nK35ugW4TzH2GO81d1Sc0jrtmB5+tUKKPXFVIa4q1aEReRX/fBE8o/iZWnpk
         W58Qc4k3eBh1PGAlMUJoT4fim+yISfukG0McutMcPRdxSyM+dwWak4ILNtfjDRrnopbB
         Isaw==
X-Forwarded-Encrypted: i=1; AHgh+Rp18dWa/eclPzer91H+64F1SMKI+zVrT/O7MqbSzb2H8YCP4gR+Qvgq0DWG1BXl5ad/Sj2KS1OfMR36Cp8KKJiS@lists.infradead.org
X-Gm-Message-State: AFuF++kS4MI0E7weOrUYA9la5Xk52MWCM4gq7sevSbJrA5rST0jOSADi
	UUNQJlQSLKnAJg7vgMvtD7jfjj3OxzlrZZTeLzL5D+XepX1KydDlzkFbqKPwavC81QPk28vNk7U
	p0qqXath+I+PAQXewBrAPac1it2ZerYbNbSr+
X-Gm-Gg: AR+sD12L1inoKdkr7pGUIzjJLjaT2mtTpaw9ouQ6aFO1k/Cou9+iJ112CQikJQYAzEM
	bwO84FtrmBaaWb8dVbfQ5bH0GSx0V34DYo7mmW05YcD8LsY+bsoQsSefrWjbdrbn+lFBuRR0wur
	ZYZSHiy4mRG/BOK61vUPr2fmwTxSjNSXGbDCH28Cnn9hd0SxKfQRwO1VdmwohODqBPD7zWm0vYb
	42+tVERbHcF0i/Fa9+zKpWlgJlyHGQ8n7l8izAwUUTVpwEcXB7rPIAmxMFBVo1Q3e1FxYnVhB6K
	bYHCL8/soay3gWF8IEZXosws1Cnb9K/y0TNwU/Rx4+Sh1youthvmZeQLELrahOwhOY9Dwu5jqLC
	6sQ9sjPsYUB2FnUq1eFAdvih6IzdokMc+M2KKaPUjMeL3kCowvuVOd5+gsqEhf/Krj4NmyCljSH
	3Z5Ml4dwpWx6vUHsU=
X-Received: by 2002:a17:902:d552:b0:2ca:e19c:97b with SMTP id
 d9443c01a7336-2d670b85ea7mr162565105ad.5.1787438223003; Sat, 22 Aug 2026
 15:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260821123249.41527-1-phucduc.bui@gmail.com> <20260821123249.41527-4-phucduc.bui@gmail.com>
 <e225c560-eae8-4487-be66-f624e5e215ee@amd.com>
In-Reply-To: <e225c560-eae8-4487-be66-f624e5e215ee@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 23 Aug 2026 05:36:51 +0700
X-Gm-Features: AcwNN1WrjE6UThXJFzEWU5wxN93h5aaiCp90Hxp9q8ViHfzBnLWUh1xBoSjqiDo
Message-ID: <CAABR9nHwTFFGVS3Y0MXsBx2ubtexaZ6hqcZYQ5au1UjxEjb+qQ@mail.gmail.com>
Subject: Re: [PATCH net v4 3/3] net: xilinx: axienet: Fix IRQ error handling
To: "Gupta, Suraj" <suraj.gupta2@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_153704_559141_ED916BF6 
X-CRM114-Status: UNSURE (   9.08  )
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

Hi Gupta,

>
> ENOMEM is a slightly misleading errno for "IRQ not found" on the OF path
> -EINVAL/-ENXIO would be more accurate. Since we are here, better to
> correct that also.
>

Thanks for pointing this out. I agree that -ENOMEM is misleading here.
I'll address this separately.

Best regards,
Phuc

