Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8E4CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqCQpoV+coXJXQAGZXFgR9yRU+YjO6pTkQa6VIOtRG0=; b=GMCyfJH8uuDBVCSg9pii57zrTm
	wP5XyCBbL4HVoYu0t4AN2qV6dHOflzR9j3Q8QFWtpBdC0wo17LWf5DIsJM2LWI55LpsKxry030G6t
	72OWS29yrgbyIM9PZ6LAXNYRhW5jsjfAg1EuQk0PHnXV3/9lNBIxIOhIkOuDhiYaNAR1pCZItUPiF
	rsybmhX05zMclAB9CXjaKF+eqZ26lJE1mbXjoc91l81J2jbk1n+qqb50yGlVmSR4Nlyd/KxUxYN6P
	fr/cyePu3It9HWEm9QZyCK7kDlwfUCsO9egDJKYCgccv4bXbloSUxGnbmIOLaq2ORWC3FM2YwoULA
	qz72rLIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY45o-0000000BBFp-0gA3;
	Fri, 12 Jun 2026 15:46:48 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY45l-0000000BBEf-2RNR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 15:46:46 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-bec2ddee9bbso236094166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1781279203; x=1781884003; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mqCQpoV+coXJXQAGZXFgR9yRU+YjO6pTkQa6VIOtRG0=;
        b=foK5Ao/TQBvhcOxRqwcFo7G0w8ixzLuzeFaDpsd4IMqes5OVry7O3XNpHX+pnCAQ8y
         Ir/iKPLPrZ7NKalZWC+YUfJ3mTVmMMthVmbV51O0ExJZ3hP8L0apK4m4n3RhnRVutFWJ
         um8ied7T81u1l5PWXGbL8cFseyNCZbUsQqWvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781279203; x=1781884003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqCQpoV+coXJXQAGZXFgR9yRU+YjO6pTkQa6VIOtRG0=;
        b=gqn1J2Iieq5KnejpjN10iHpcoEgTiG5oN9QKVQguKD/zynBsyzPz0LecPhFfMwMPZd
         z67S2N+e1ItmUN5bbSSkkOJOagn/a73mmWL3ySQw98zyLPQC1KRr06xu7ElXE7lvdZQ/
         5wBc53qRpKY4wgA33VCFU1JkKQcKvjLMhfXJOA9IP4nFawtQXSMsOPG3dczbzFNxJWbx
         jhmcHsKxl3O5ysMjn10YWfxL+/JHeqgqdQ+xdu2LqOKk4R2cwkzP7Kpf3AO/pPAL4Rz4
         xbG9/omaTTJmqPDQN+jTNF9OoD4I1OdmaMUwKHHbernmWCWpwaxrW5gplF4t0TmtQO1j
         hNMQ==
X-Forwarded-Encrypted: i=1; AFNElJ90l5HZUq/R7uP8LHJlP+A3q091krCqD8knzOZKgoKfHipT8CQaJ4waGlSFWNJIL3h9rgL34sVw2yBpwpRVXR6b@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/l+813S1iLP86zarLmKwJiGwjOM4V9WKiIcIURwJRBRc38P0x
	lz+lHo1w9PCMeTnW42XbDaqlVgUtF72r1Yye/ZrQHnT7SrsNMw97relFrHNlDRW/vmblup9znK9
	Exo0DEdk=
X-Gm-Gg: Acq92OGBxoQxf1B/yvOJykXBQpZmek6cDq+0jX88r0UrAzxzoaFUwWbLpac3cR/ppGh
	KeHxok4yNZ6kraAILMCDF8eS4eh6hRX5B1AG/ReF3kRVyjZR96vrWIp6/dW6un6v6GUDt4hRzjJ
	BJZygHxj+QZ39yt+4MFLwRbuLmyLDbE45LO1DmMpjwnX8KpTyGswUFKu1hIm/4bocRlfT9K2Y2e
	ssLenUKbZvAalZ9rzpJfK8RNjK3L309n0PwC7HifZ4wGXowMAc+Oq+fTJl1qqa5Nr4YMizcT4YE
	K+fiCcPo0RjBJzrKpRHOA8uay//0Rkr0uCYHFOXqmDcGmduVfD1Bq7kuSBO0sM86/ErfvrRZPfk
	pcmkc8b/2CwPLBrT4ntCrmZjHj2DBSdero/Ek3cbQmnAej8g34MVhtsi0r/Wh8mu7YFFGWcsrxW
	1bFJ0AkwwBZo9lJqav33rB6MFWULkZ50NbqBY5b0etSp41a0kyGrD1oBDqi7zugr6iawVE9AHe
X-Received: by 2002:a17:907:e143:b0:bfe:7f45:44d7 with SMTP id a640c23a62f3a-bfe7f454612mr84997766b.47.1781279202928;
        Fri, 12 Jun 2026 08:46:42 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b240bbsm122464966b.18.2026.06.12.08.46.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 08:46:42 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bec2ddee9bbso236089166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 08:46:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+IHI4pvKyJXXfu0XuJ3iijbfaTu9jxI415Ov8i1hi0dvgQqSFI4iSG9kW/1lFLvgFdw8et8mpuYln9E409j0Ik@lists.infradead.org
X-Received: by 2002:a17:907:1c1f:b0:bfe:eda3:f8a0 with SMTP id
 a640c23a62f3a-bfeeda3fb97mr86115666b.52.1781279201920; Fri, 12 Jun 2026
 08:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <f4034eb3-455b-4172-872a-5e94a53627b0@app.fastmail.com>
In-Reply-To: <f4034eb3-455b-4172-872a-5e94a53627b0@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 12 Jun 2026 08:46:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjXnaYAEmjB=uhh09FQ4J-fjnO2ramtTBiZ4Aa4qqSAHQ@mail.gmail.com>
X-Gm-Features: AVVi8Cc5w9HedteciJuWEiPUV0ypkt7EOCFg1d5H2aaZDK2l3WJ31f_Fy9Dyyhw
Message-ID: <CAHk-=wjXnaYAEmjB=uhh09FQ4J-fjnO2ramtTBiZ4Aa4qqSAHQ@mail.gmail.com>
Subject: Re: [GIT PULL] soc: fixes for 7.3, part 3
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_084645_627237_D1DD2F2A 
X-CRM114-Status: UNSURE (   7.60  )
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

On Fri, 12 Jun 2026 at 00:23, Arnd Bergmann <arnd@arndb.de> wrote:
>
> soc: fixes for 7.3, part 3

Quick, while you're living in the future, send me next week's lotto numbers too.

               Linus

