Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF809EF36FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vDY6Fj7fj/w5+bjRx0OTlDzLgihUrZ9NyoCl0Dr8CM=; b=ipzD/1MqWldSsmJlLL6mCDq3tn
	vO8yA3bY9CRhvVCV6hpK99fVYCSsjsD+OKt42BtUsePX3PLxFLx+9hlb621ryJKv6ufP2uGwON1qp
	bj1lgPKf9EPGV4r6A6h4zgCUGJyHTF/TrfTHtEQi+aFFLXCaPoXqEjv1cbtTu3YN6bSfXZmf4PklX
	5MJsm68UREoaLNTgCa9TDyKA+i/XAUKGxoBvARe82XIDBFAy7vN7WtULFvN6cgz/F1XVBoOZ/ktvW
	27gT7WI4YaHnWq+kpaIJ6QvJV8das989aYfltphkCAF19A/2zSeV6IqzdiO612fUEbq9CW/D8GJwq
	TEQYLQ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVnD-00000006sH6-0OMS;
	Mon, 09 Mar 2026 08:16:47 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVn9-00000006sGg-2bNz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 08:16:45 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56af41d1e0bso1673742e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 01:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773044201; x=1773649001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vDY6Fj7fj/w5+bjRx0OTlDzLgihUrZ9NyoCl0Dr8CM=;
        b=dyZut7dsGyw24dJtpMLA4Tx8Q/6tKqBDdQX4KZKfHzwngZwlnFI5P6CDRtWU67eD0V
         8Q3kSlUwWHroNAnRqMHAuZKKUp5sMyOOXUjoRSMddJuP1dYu5XLvlR7lLIsOPTseapry
         5ByM5PktmddM2ksjQuUoBIYP/+t+jhagMYcJx7BJWPGkI1Rdz84XDrN/zZ8kZ6t/Ao7y
         rHK7mytuo5uMB4r4rPVoLOzs/c+g+yt+pm2t+fBrXe+I3NWfcDC9wXm6GmBm1RYVrtyD
         3rEIalmfdONX6Bx26Y8stz0mRbI/N7cOlo0/VPBVXMpp1E4HCocW46KK99gd+lh8A96i
         7D9g==
X-Forwarded-Encrypted: i=1; AJvYcCVUoEnTdTpizBfAb3FJFK7gaV0GpBV407iNk9xPSUmllJaE8jns4OV0w1yvf+Wxo1x19q6azSiXIwQ1kYXd0J2q@lists.infradead.org
X-Gm-Message-State: AOJu0Yzobl0BWwE3J5g9FLavyOdWi1IHJUAzQqt2PeeiAxPyRy0c8gOg
	CkJuv8P7rd0dzMRR+7jEyixVLtn5lCzOwtq8uPdmWLCjEq7U27u2qvrakjEaX8xX
X-Gm-Gg: ATEYQzw7n/VvbaQcKmVOOl63ndxrHH37IpcNRGcucPmf2cnyedqSCZN7mcw94pqo/zn
	a8xk+f41ywUjYTd76h1jPWYxA68J1CGxPe7fL/CCNfAc/nmU1lTx4yQwm09thUrAeSfCPAk5eLy
	G19/0YKLc+C6nTCr8tn50U7KngpzMtmozo/PdpP8PtOckNsKua7/i5/B68yHhgZCLvm2urSQ16K
	nkJ4pmfYO9C+cAmooSluers1QBuQQwYsD0xdVe35kwBRSigBK2TDN+1wjFyRxFlz033O49jt5wZ
	j9y43/fWBYU6GzgE6PJI+VboOPWiFB+blK9zLLJWODX7q7R/dxGtfV9isClWk6Mn6gLXJAF2C1T
	1iZuPBUZ7rWsDSLVPiMTxR/D9fE+L8KPLBSq4AbnoMJPozlHlHtLrk9xny2lwETGvINWNmr+WxI
	jeQ87u//dPHJBGUA6MR2DVnU4gmScGQJ85YIdEvhW42N7UOuA0yptiRDbUQCSoTa0F
X-Received: by 2002:a05:6122:548:b0:567:39dc:43fd with SMTP id 71dfb90a1353d-56b07f20345mr3694656e0c.19.1773044201361;
        Mon, 09 Mar 2026 01:16:41 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b0f889ed2sm7529900e0c.13.2026.03.09.01.16.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 01:16:41 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56af41d1e0bso1673735e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 01:16:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDFGm36MrwiNEMM6XmO8Wi2eytVicvKURNIJEelv5PECROeNFjY7sq3/cMfjCHWD53X3jm0fFG/ujCAB5FbY8b@lists.infradead.org
X-Received: by 2002:a05:6102:944:b0:5ff:c59d:67cb with SMTP id
 ada2fe7eead31-5ffe5f5e8a3mr3541635137.9.1773044200697; Mon, 09 Mar 2026
 01:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
 <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
In-Reply-To: <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Mar 2026 09:16:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
X-Gm-Features: AaiRm51ocrPqb7jpQ7WG7J_Ckto5bT4cb6pqd-tn1P8a44yFS9mg7m3aB7Vz2cs
Message-ID: <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_011643_681141_23605B22 
X-CRM114-Status: GOOD (  18.25  )
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

Hi Sudeep,

On Sun, 8 Mar 2026 at 14:01, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Fri, 20 Feb 2026 10:55:15 +0100, Geert Uytterhoeven wrote:
> > Fix misspellings of "multi" and "currently".
>
> Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!
>
> [1/1] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
>       https://git.kernel.org/sudeep.holla/c/4e701b47c3ba

Thank you!

BTW, I noticed some of your commits use the non-standard
"Message-Id:"-tag, while others use the standard "Link:"-tag (albeit
with the lore.kernel.org instead of the recommended patch.msgid.link
domain) to record the origin of patches.  Do you have different git
setups on different machines?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

