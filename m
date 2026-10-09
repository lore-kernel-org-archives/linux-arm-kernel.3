Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADCECA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=; b=W9vQE7sVzW8Dk3ERw0jP5QaMsL
	pXGoQgDYC2Mg+g533ZdX6XrXfhe5Spx02rVvbe10FxEWRDfB+gfaFUe3HOLGT429XUer0DldHEcKk
	RZ1II15EX/GaMC8SFhszaE4WGqkFIdyD96UpKAYDWft0ttpEkI5Zp0Nqvgy/DU5quf+nXYDEs473G
	tWCm6QJub+w8yCfuuD4FH1o/hbZr52xa0nkDQI36cKVOSirZTJPtuwGuE/9MmNv55oRkO7iSpBsDl
	LQO/3semg5Uoys3qP+0lPSDonJLl3J/Zo7t0rjy/rIZVAFt7i3exPo6JezY+yje5xqGCDq1XmFpnu
	qevh+I/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4v6-00000005iCo-2Iba;
	Fri, 09 Oct 2026 07:21:32 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4v4-00000005iC1-0aOy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 07:21:31 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso5111118a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 00:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791530488; cv=none;
        d=google.com; s=arc-20260327;
        b=rODYNquV1Ocaf1bsq93vfRb3huHqWZtm1N0pXb//MqQcfXp1PDXH3muM9WzWE2olFC
         LPMHYW4gljrRr+GteI16GBvJGPOGlC6ehproJpSwjrkRlWkK1X231gYSYlN26YI6r2Qh
         nT3507ejIM1O/bhSj44YooANKugL6oaTqjPr5V4gYt4xhUP/5Q5YSjvQi3DBFDwv/OM9
         5e2Azd6o0emYUZUJMNmwvn3T+73KRZQYhUsJwi7ActiBLoViYw3tMcdOP+LTpMwL6fK+
         ftRe9ozrl4/XjBqZJWAG9xKiYB+JIGaKE4YVsR1udIp7nmLawdW1Y1hiwvGV3epb8zFB
         CxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
        fh=2siS57dLfjbc/JPNoenrPmYgKWEp2tp+m9Y6KGu+1Yk=;
        b=iRRRaxJidVegKg+uIPx8Ur+D1f3in8dUTepRpqr2Q5WSVMGe22O5KcHGUM7bBU+Eom
         wrSA45lNkbYgAbSdQGramiwPEpQsS1NuRFSgxRoizz/WSnr1p19oLn+pWZZtGGa4OiBU
         uaxaLFO4HvbncJrLmrK29VNOWqirpVUqAXWHM/hcnVM8p8GMcXOSkQttjHfuRq93bH+g
         Giuy6K25Wiep90Tyh0HOE3VROtYQaBQ+OXl58yLBCmFHxjmW+lOLL6Hls3QV1BwN07aj
         B3lZgjN/KnvyJG4CYSg8F3jGYOd82qn2A5VQcdk/yYJPH+QbL1NHyRCJOL+Yfx4MHxUv
         7NOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791530488; x=1792135288; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
        b=Wz2YaPZWP1Fsrx6/nIaSQRB+6UI2mdn8SNqXRFZ1DMxMSddHROFcbN1THBV50YVqXk
         gqfATVQ8Pjc0wYcigg1KQOza0PHM+/3ZQgR+2XaHwU8oI61T+PsCvySOAQuvbCHSEJVg
         vG1FtaEL7CNQ1gyLuifcFWqRgCnUohFWddSf9uNpepBZYEtd9C0sgUs3RjdFhXlMBhf2
         OudZUp/XjcJQeqwidaIVt88VKUgLZwCLBqlQ+n8Ca7bTf5nUElcABKzB/HMooI3dL6PD
         CDWVypHP6YSkjErPskmItkcmLanPTPdDT8+jEAbREfT8OYEMnL2jJCtmXPR1CN/+f47K
         zN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530488; x=1792135288;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
        b=J0Q8uSGx0hPbCxBtwJeByAJv6rDbOSMxNrIWTit2L7WiNfoMUnY1CHaWJkIwepo9xa
         52RQU+rzdpf0jeeu27EZgiDEhRWuoH+BM90A81H3JoUrPOkAORNXummjqobGgFlAeq1F
         nCLhb+tWSLU007bOxJMHKsbYtJELFblzsERWFry11hZDaUTfVP3WcxT8rGqdsPFiuf6v
         hJUjDRbONB1BUpUOoldk7w0PV/HCe5HMA1eL5vZf0PyOKkYFxR9EVrHkMYfh9vRCGQhh
         Vohn83VaQE1uAlKu7tLA2MLrLuuW9V9C/6Mj93A87Kx1bz3fPWsiruSfcu8HjVERovoK
         itnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzioCMGxqAdDCH5Ek3GLUJFJMSG99gStAILUN5Lfg5mW4QmP3TJNg18Szn6iyv9a/WWrP6hxkFbcHvdNX7d/Ay0@lists.infradead.org
X-Gm-Message-State: AFq9FYJwnT0xQhYT1g3Rcg4glUNioHJBt8ctVNbCHx//PGFzXuKdils4
	6WqhYGI7qqLk1xckTQrDtinmdkALh/G5Ibb8up32ufEgqZMTidTWBc91oOLgctmA++oCv2yMdH7
	wgf31YB+KEgZUYmRzOfqjIbu9NodYR1I=
X-Gm-Gg: AYBFou0nONUHFWTPdC5G7RpT4w00njn/PW1miZc8ouU/Y6lMmrdWTV3xwf64hXAjJAl
	Jm82XJgLRTaL9eHFNRPT1TWP8gZX/BEW+kw396ja576hZfszRh3bHp+a1oubDfRoGLNXZRmxKj1
	JU7UqYAamsTd109kJ8hCPif5HGke4fjI5X6RMazovkBRrHOsB8KB5ujiaheLvm4+YO6o4IPWhj6
	zHdCXN74TXBd6EJ7zloTX3SIRyVGXhNJ7V9EuWP3ajpuDjJ+NiXpiBJPWYMLAm+UN0nnUfK4fkC
	GLJDeoy8UnnRCsz0mzY6RlB2nEHtSZALsMLOJx5Bo8GxYvwOVEdQQfTVdk8pUyTuURkz/p4j/S0
	d2zIChtaDi0hwlJ4eTDMjuEEspRVC1mneJh6tYwW7o6HO6Djk/J5Wu8vgXqfjy8nTqK4=
X-Received: by 2002:a05:6402:2489:b0:6a9:aabb:5364 with SMTP id
 4fb4d7f45d1cf-6b17c2406a9mr722739a12.11.1791530487888; Fri, 09 Oct 2026
 00:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20261005110257.50145-1-phucduc.bui@gmail.com> <20261005110257.50145-15-phucduc.bui@gmail.com>
 <24ffbf82-adad-4153-a2b9-f2123189c722@oss.qualcomm.com>
In-Reply-To: <24ffbf82-adad-4153-a2b9-f2123189c722@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 14:21:13 +0700
X-Gm-Features: AclHuK9p57z2uGUnULQbpxyjyLXl9q0M8bfa39_8UwomVGEzhtoBlELb83gkc1g
Message-ID: <CAABR9nETXgKCex=sDx6Y=eJOTg42oj0egGv6268T14v510Zf5Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] ASoC: mediatek: mt8195: Fix clock parent error handling
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_002130_187755_398866CF 
X-CRM114-Status: GOOD (  10.57  )
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

> Was the intent only to get the DAPM error log
> here, or should the commit message/code be adjusted so the behavior
> matches the "properly handled by the caller" wording?
>

The intent was only to get the error reported instead of silently
ignored; the commit message wording was imprecise. I'll reword it
in the next version.

Best regards,
Phuc

