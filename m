Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270A7E68948
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 02:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKXp0moqgamIP7R29DMbOfl9IdZ2pJ/b7R2GlsuQTL0=; b=BoNUCOuykjuGSX5O+T8UTxqLYZ
	YNCOF/jkteU5CNzpjwzdL3Bu9MisWR6jFR+9ci5Kryv8rocQUW2WAmiZmuom8ehoSXFGM8atfQSZR
	XVmDdN1u6pSePtjBnF/Oqbu7pYdK4+xy53QObsTNodVe0IcqHU/VdMxg3HmJBIxW3W2hcq9VwELXC
	scnnk9+lMtHLsfMXyhGn1nmgMPKvcQxDlAu4r5EOvsLtoLsE4vhP/dxZEEd/a48LjbYSRX/gmyGM3
	JVGJC8Ms6T//S8mi6sKk2VQa9oQuN7WL9AG0pTZC54LcK+mNnGyKwvgTa0kEis72MHh6Bl6BhcYWN
	jGiF9mUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6KfZ-00000002KXS-13on;
	Thu, 31 Oct 2024 02:12:17 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6KcT-00000002KGf-0SLR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 02:09:06 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7181b86a749so172638a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 19:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730340543; x=1730945343; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WKXp0moqgamIP7R29DMbOfl9IdZ2pJ/b7R2GlsuQTL0=;
        b=PVBbgrwpSJTo6cb8F8z+7X3ED001Vn2hbjyqJt5yvlMPj5ikXvdIkQqD76PPLxayur
         MlByO8/ap2ILgvvUcI0VYHaDgEwVar83RCRfHfw4UH82fbvdCY2ljPPz0Um/5mRn4axp
         3r0ZCwgtIRu/xDkA58stV3k/TKjs8bFGrnmuR6UVCtEWNVpu3EPbwB6ryZDUAaIPisY1
         K150m9xYlCABbGTpE6lT0u5Zj4mWpBIR3LAS++ql+R6GgW1ia/sdXc6pFmvgk3LEiYKo
         cRG0bcwKc5HdmttuxYIJ9xn4u4a9CGaESQK3XGNbMLsM7L5xgW7FePg6dMgeSN3wPIyS
         mpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730340543; x=1730945343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKXp0moqgamIP7R29DMbOfl9IdZ2pJ/b7R2GlsuQTL0=;
        b=Av0Y/rNEQrH5eAS6atWYPg5P7SfbBlaIsMB8TieaqaRWMGjFGeSNsawEyiNDq2gcXB
         nbjWoJ7Uo9jHPWl0m6sorCQmmeJOS7nTqZIWvlvHq2t++wrcbRkm2XG5L77ZS9j1Y8Yt
         ZuLDUmkUTfNVWo/FpDhod+BXjCWO87gAv77k8dSiaUz3NgTBq64hQk7/49/hhTCulvAO
         gq7iMkk+6gvt9qhs4jSf0MLuMZkJut9dsWRU4McM07c5UDm39n7hMQifgJDBsN0+Y1EJ
         i+VqI2s8/DVAJ+La54tqQrLIztq3UwxzKatkCZaWRP6c2SReFT22krVkNGx6D3vG3oWh
         xmtg==
X-Forwarded-Encrypted: i=1; AJvYcCW957MDPeEc1W+m3HHQVam+J2EwYv+PIGwDXWh7iYyQYeqCZ+APN3fPPKp1QSF/NSA/qrwjY70SUyJwGr5dovBB@lists.infradead.org
X-Gm-Message-State: AOJu0YyGtqDz/1PnCdQxLZRFWFRJX/2lzE0KmJyq3NSEo9OvhfvfEFTI
	WPIRAgxl6PpxkzooTGM1pBDvxk9AI74JrHu+Gx6Lb+r93+nPDA4Sm9mqcwT90a2JYBA12sTnTPl
	F49LEXCOeGqzMP4GYhZU9zpv8D8I=
X-Google-Smtp-Source: AGHT+IH+yrLiJjq+i5ie1WCex04mIWFRLsmq3qV+TlaiiaefPBEphpMHstKWEPeLMuwYfiGYCJ48xmfkRcN6cpgnW5k=
X-Received: by 2002:a05:6830:6a97:b0:718:240:42d5 with SMTP id
 46e09a7af769-71868299585mr18071136a34.32.1730340543144; Wed, 30 Oct 2024
 19:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723716331.git.stano.jakubek@gmail.com> <ZyJ1keHD-neTNZ2J@standask-GA-A55M-S2HP>
In-Reply-To: <ZyJ1keHD-neTNZ2J@standask-GA-A55M-S2HP>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 31 Oct 2024 10:08:27 +0800
Message-ID: <CAAfSe-uZ5KWfnZ=DqAy=4fJp0TrTimdEs0Vy57CYcsK06Ev_UQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Cleanup Spreadtrum/Unisoc ARM64 DT (part 2)
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_190905_195024_B22B631E 
X-CRM114-Status: GOOD (  10.22  )
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

Hi Stanislav,

On Thu, 31 Oct 2024 at 02:06, Stanislav Jakubek <stano.jakubek@gmail.com> wrote:
>
> Hi all,
>
> not sure which tree this should go through, but could someone pick this up?
> It's been sitting for ~2.5 months.

One question is what do we do about those warnings reported by Rob's bot?
Apart from that I suggest you send a pull request to soc@kernel.org directly.

Thanks,
Chunyan

