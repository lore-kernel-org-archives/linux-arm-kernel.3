Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A4FC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 06:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vkhL0nOODbXgDR4wi4Zsc+hIMhl6G/kmLyU640sopY=; b=sQv1J54D9Au4cDuHmHW+89NWJr
	Qdjkl2IKgc224/odcqaGTracDauGz6y7vCQd6UO0m43Jb20AY37CS+glq52xD75C9GF6rjc3tFg5d
	7M891a5v5MzQobNOgMWtutMSEy+gO2XjBef1CqaOtckSHWoITyRXZZcntzhQP1LLWpVhO5RhnW7Ze
	CVDOvjWNlynACpcJSjH+reopaZdzbkcAkboslR1Q1qJygBw/1fbbH8oMrDM5RJoRB+LSauu7s6z7G
	jOBQFI7LWIQx08PHGjDrLeW2y2Tk2G0HG9UxMMyswhanEWv0n8alimTJj5vKCLJPW5L1jfoFZFkjz
	hZTsmPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMvn-00000008YPS-2hBY;
	Mon, 12 May 2025 06:46:31 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMoB-00000008WUm-1JjX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 06:38:40 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5fbf1026309so523478a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 23:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747031917; x=1747636717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vkhL0nOODbXgDR4wi4Zsc+hIMhl6G/kmLyU640sopY=;
        b=hgMIn+CdpXg0YGOWR+1v0vRiLzjd8XrDPWG84Q2NeWwaNJo2UvMCuMRFRkkmEkORlJ
         iU2oJCDFKc5gHK7tyqDhLY+5+d9Sryct2gURj7R8Y24G+G1F3xEaV43etRXp4oDT96tG
         M7uBSwLsMMm0HGXqJNht/k71m9WmcizVxuy3VwBzRPMdKtTuvtCdP2hm0Fi0fV+9H0RS
         T+B5I9JR+9i3hmM569y7D+9SLfuKUe4+3UsMKyHs3pf1AB9gIgSQfqGOWeKQhVDJKTBW
         84fdizQj1WHZ6wWebKdAo+HHDlcnZbNU0HwcIMsp7hRFAWbh2Jv4zSq8/dqfDRHfsOAK
         fwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031917; x=1747636717;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vkhL0nOODbXgDR4wi4Zsc+hIMhl6G/kmLyU640sopY=;
        b=XkBj4t1A/dCdSU+kcKmInk5+yus7Gynv72vzbudIhvzvCEASozNfCh65tweBO4MKag
         kXUSzcbQRiRabjhr85YCVjSa+lrvwgeZiRXvcqr5ZosR6S8S5URS8lIG+VJ/DJTIjVts
         4+hZ9/dtfQL/QYRQNAf7XHSHgu7izd4LabT+gN9YPm+FBbWV2PkWPX0s2hevD/yCVOgz
         ZjxsCPWqumvZqZmt9nAoUNWRuMEustaw1UIAPg+Bybl9urDouZ3LvBnHQwGWaWj6rouG
         NGgzsMTBkX6w9i4vEuPyt0hH6t+T/YjIcCIDDYpyvciWhJ6jvCWsGTS4TupB9okZUEjm
         LVCw==
X-Forwarded-Encrypted: i=1; AJvYcCWmTYgIX7aG5ZZ588mmDb9M7a4/Sy+c+DMCgMBCTgY/cfG4QRXuNMS/FfMO2CiU/Ps7qouGo7PFaaQ74drp6OEV@lists.infradead.org
X-Gm-Message-State: AOJu0YwLvhLyhM7g/F0UxwcraYpODTVaZm/5tKtSzItU3vxFvEe3i4p1
	ZqxN+pNfTwl2mS7kR9ZPf1+txBgOKiKrZhgrVSeciipguP/Vri+tDYtJrUccdOE=
X-Gm-Gg: ASbGncu32ym/rG52A5QA8el4H3QwVbkBOjcd9nYKsgVTzJUOPouPYRPP5j1q528KBzM
	A4dLy2kV8LTNrW+BWeEXmoljvwAKlXJJR4HXadmd0KGsuF2Ew2+r62R7W8bKaKvt163YPyIC+Aj
	kk4zMKMygxuJg7ID1SxYfXeeEd1AKIpH+nCIQ+cChFV7ApGTXArUjpXYHRaPT8QKGN8uMh+Ivsa
	4ZmzGZ0azKWsGT9at9SN5X2aRa4DkTj7onFrbYBfZ0jOXdIMz2DA9YRzA5cZzCWQ+X/pu2AVU3b
	U2WJ6zB9TisWw6LL9/aUB5OrldlhTWL+x5h2pcb2htGqPEF84Epw4XTKWENnN4NOjtr66G8=
X-Google-Smtp-Source: AGHT+IFiYR8aqbHYam+4dCJWIuEBLrMR51O5qEO8DmYKMA5elm1tOP7pc2ZsyT0EJd9dssnjv/KG+A==
X-Received: by 2002:a05:6402:4309:b0:5f8:e24b:c8c1 with SMTP id 4fb4d7f45d1cf-5fca10e40bbmr4214805a12.9.1747031917576;
        Sun, 11 May 2025 23:38:37 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d700e92sm5210075a12.55.2025.05.11.23.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 23:38:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250509104459.28167-1-colin.i.king@gmail.com>
References: <20250509104459.28167-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] memory: stm32: Fix spelling mistake "resset" ->
 "reset"
Message-Id: <174703191639.30920.15410579051169981008.b4-ty@linaro.org>
Date: Mon, 12 May 2025 08:38:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_233839_359601_7C77CAC7 
X-CRM114-Status: UNSURE (   5.98  )
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


On Fri, 09 May 2025 11:44:58 +0100, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> 

Applied, thanks!

[1/1] memory: stm32: Fix spelling mistake "resset" -> "reset"
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9c03507fcd6feae37a94eff376a1aa79700dd54a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


