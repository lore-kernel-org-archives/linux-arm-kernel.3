Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E51E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbACf+zYDKXAWssDymW0DKWC7LQPGZm8j9ATdknhB08=; b=18tUau4EBc0U3vT/RskfgiEVSN
	smuUkc+oxSXn7dIfhh7zk7Pe8en4IrbVi4GEsPHGK/PakSdL0eTxLpi8aMzwSX1fpILybdS7W10B3
	ygoLlE4NeDOGXvfXwFGuFXK/bzkiQAxBK/43/VfO2xZtrkjxqaYYBhBqevfrXRw/N/JiT1AdTiegz
	VspvuzTaYT9dmKJ+nH0Pc7NvE8UX+GoBeoXIUljLzXqLfXlYPwBH/Jj2TBBFNrpPq/bY1WMGnC0OX
	ydndc7du8bKVcf5mbZshFcyyxzMmeSbPuPg9okFz6/xYFH0yU0cPqPiTXiSzwfhELRYaJaRexScGD
	HOHEnwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGz2-00000005VBL-3C1k;
	Sat, 14 Dec 2024 01:30:16 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGxx-00000005V18-05eL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 01:29:10 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-467abce2ef9so57111cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 17:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734139747; x=1734744547; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FbACf+zYDKXAWssDymW0DKWC7LQPGZm8j9ATdknhB08=;
        b=OGgmIcsHBg3/9DLg+YP8FWenzHWEQiOq1ss5ZEAhUQfhcL2e3x4iGQMXR+fqxd7gA5
         KFKf8eUYCFcOxMdl1jdroDV+rQQm2O6EhFjwrD+b4mZUkma4CdEP2u5cRoew155LP06u
         PvKPB51VDRtHVYioXQ7nJzr+Glvy8XCEn+eL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734139747; x=1734744547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbACf+zYDKXAWssDymW0DKWC7LQPGZm8j9ATdknhB08=;
        b=hCe6jMpzUU1EEeWf5EfFGjVIhMo8exXMrZJnb8S70zyp3TPqvhwRziUjt20y+Q381z
         EBETixqlXB1qiYWCU0Fvk3at4LPU5ilELisVMYMbFtYysjWP1aTKk3XnP1gSdexusZtR
         3sAodEsFLKrr3xetGqKjFL+U42sEEdWKDiU/5YXae/OXUE4KSNXQBtJqskY2LVIncUpp
         8xRb3qZGr634A/A+WVLGjhDg5Ioi4dxgGYMz+p8TPHChGDACOjtdk3t0EHOGTERraY0K
         1pXN9KUC9xYf6A9GTRvmwqxrF5wghYHYtXnUcOsAqG1uZR4+NYCffGmrlgtMxAzrUWst
         F7+g==
X-Forwarded-Encrypted: i=1; AJvYcCWQWaXSjLSBbkFg4vLJ0h7I2EEGqD2ZOLb4FkaClqWvphy6Ap6gvkxVG91ywR8fPUwQdDSKlFLdWEmXwHA6PIMq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7k7BTtA7e0KFeABbvW0Bu9USD8AfAzVNDG0/vJikj151kCSFg
	e+bx2s7lUOewx9z2ZFiZy/jCWUs8Wq5Jujsm5OJwP4dc4FHqi2b6WrLaKXnVgEXCtWmbbuwK39/
	bjwZcoXA778d0cFDNYu+hLMyQicfr9kgaV2C2
X-Gm-Gg: ASbGncuMYE16p8p3/SpdzkuNhrAxqdYCQykyI4ch8+7PPCv4d/4wdZon7h4CMEf3X33
	Xck8L/rvxf0hq4lJVlGjjCwN+kHLnXcUPmMI=
X-Google-Smtp-Source: AGHT+IHNtwf8QADinV12qA0ZzZiycG5IyBHw5q4jrC1tLoJV04+MI6FXaBeKEVoVuATlTKwSTdw0HE6Zeb5uzLpINtk=
X-Received: by 2002:a05:622a:1882:b0:466:8c23:823a with SMTP id
 d75a77b69052e-467b4a2978dmr640821cf.17.1734139746638; Fri, 13 Dec 2024
 17:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
 <l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq> <CAD=FV=WQf+ig21u316WvQh0DoKsdKAmZgqPn5LB-myDXsJtXig@mail.gmail.com>
In-Reply-To: <CAD=FV=WQf+ig21u316WvQh0DoKsdKAmZgqPn5LB-myDXsJtXig@mail.gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 13 Dec 2024 17:28:55 -0800
Message-ID: <CAODwPW919K+XdxjUe3aPgxsv0CEWwx0P_Hxvf=VniLhk8eagkQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the spectre_bhb_k24_list
To: Doug Anderson <dianders@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Julius Werner <jwerner@chromium.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_172909_080095_C6FCB587 
X-CRM114-Status: UNSURE (   7.30  )
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

> Interesting. So the Gold/Prime are actually IDing themselves as
> straight Cortex A77. The Silver is IDing itself the same as
> KRYO_4XX_SILVER. ...so in that sense there's nothing to do here for
> those cores.

Should we add some comments to cputype.h to record which other
products are matched under the same ID?

