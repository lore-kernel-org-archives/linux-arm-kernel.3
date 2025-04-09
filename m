Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B16DC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91in10Bo377Kti0d7FHmcV3G76xUTbUrZole2RX2WGg=; b=x0cz+qmX36wFdWYao7OHo8qWhA
	vE/BTz307RXf6RjNTbUKE+5iihMALQ1KJ8Z/bA4hBdj7K4Sshpdv25atlIC1jYIHYKvIgP/xZ7EBn
	fSFtB/8cMTL1GV9Kc8cYHeVvmzneTUYPCi/odbFarI9PRVsTn2UZapxqdJy9hrCJslCy1POxhVkrS
	jl9hx0Djlx4H8a4qcTFqJx3pBY04X/GWW7iBpyvNckvTVXnBZYMDZyAjki3/f6kYv3Lfna3jmLUpk
	9c0HRgTqS0BXUSyBQWUIOEdXSqRsCG2GjkRp3wmgZC8xsVkW3NFm8V4q6O0HnWCXu/uzbikYle3dw
	zJBEMpwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UdS-00000007AK2-1InI;
	Wed, 09 Apr 2025 12:34:30 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UV9-000000078KF-37IZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744201553; x=1744806353; i=markus.elfring@web.de;
	bh=91in10Bo377Kti0d7FHmcV3G76xUTbUrZole2RX2WGg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Luqn26m3s+UeS0jyuADpzZ2jzBZVhIZkqtkWoZPoU98olV//GDy4elBsYUDQRE7l
	 9qMD2EOfuawMebNW9JHgAEhxPVSYRyykFIJ+ctryKkhyVdPCbnqMMHJifBdPEvMWn
	 jwKDhX1Qq+iJazNVL7tGl+g4iLl6RFtTwsRX4bEqfwpIoDq1mwzmfFxLbMQMV8RvY
	 9aFmT6POV9I6tgfxn84qbfsnFTwraoFOXXiOW5Dl4D/a85/L0gPwfjJ36rqk1uMFC
	 aNvNuSKDddn4nFRYJhW8rQ6I2oMHpi4Moq73UV4jL3xFDwjERccGJeo03EHL7oXjI
	 4ongejd1NRdZFg7IfQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.27]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MGxQV-1tozqM2Uqp-0029Qb; Wed, 09
 Apr 2025 14:25:53 +0200
Message-ID: <3f5662dc-7547-4585-a396-4546fa98d34f@web.de>
Date: Wed, 9 Apr 2025 14:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 0/2] cpufreq: scmi/scpi: Fix NULL pointer dereference in
 get_rate()
To: Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Henry Martin
 <bsdhenrymartin@gmail.com>, arm-scmi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
 <0558b7f7-8c69-4664-afc6-bae4fdc6f071@web.de>
 <20250409-merry-gay-lemur-8288cf@sudeepholla>
 <52aa52a5-7081-41ee-872e-f1728c06daf1@web.de> <Z_Zhp38o9KiicPVw@pluto>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <Z_Zhp38o9KiicPVw@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T0cXVK0d8v95DyOXS0pqeKnH6XASFIsv80j8jEk9rqqhlJOR62y
 art0PqrEY2cIo6ymg7K/FDjUXNN9THddBM+wsuPi0SbrEtnddwVf5Yc0CWLLfWCSzD9C5sW
 zfW/a0Uvw/252pNYhEI111JYTuvU1W7WpjO4qOBG8w9EDLXGqbKHf1s4IqJ56EGCW4AEmla
 JLalyEJxFzLCNosdUXbzg==
UI-OutboundReport: notjunk:1;M01:P0:Usz1cshPlwQ=;BToUsUhaxnExn17nxgP2athAK99
 nl/VF8jGo9Y4SMCCxx4vlGAGdfUNPtGfvDlkO21zLGs1b1SMOwEHa300krtdP+hK8O0Lv1M8m
 CXCDTwM04vzanod2pQCPW7YzbvN/xiqFa/mq7BmCRQol3nZggJowQ7ylG1v3CZ4fDn8uTNbyN
 Dur/+k8EQ8truB/N2hl+dWSjtg3k8tAQSKNnsH+Y7/4+7HCBy4TFfvc2eHDCxJjX9IpI2qY/B
 1mXqz3g5yuCXeZFKkPTN1IcQMw0aXiVD21BrPZpoNhlf0o7aO1pNX6WB94BNM0hAtD1Yp0MYZ
 +Q+msQamOVvQnmvsYu5ZFLFosaTRDccVDml+fGDlm3x+i8WV0f/32W/ypGIjDmevEvq9p6CkD
 UrEEokqRTmIlVDjVpJOvCvlVIp8oKxitJ3FyMx2j3QKNemmjuXIO6ftbPoNrV5KEYu+j3Avp8
 P9DJLXj0sXVjlZqLYMq4mLctjUkSdBDtyrhUfS5Z9Njc2evWXMTWT2JLXcd88za42RGke9cUy
 soma6W4U0Un8ic3eVXSR/XCizkvXx2RQP1q0mkTZucIVVUMjuTXF/drYAdMlZMrptaDZLBLk1
 U/9GMyngBPXj7woXJiOwrryOu2SUjP7XfqN0wy3v4HmLdib8EJSrshyYiI7zRRFJMyqtfYa5u
 g+jrMC9wfw9oSi0M2xOaeDbYxeOSGjRK2yVqQc+qxrvSYxDfovP46qPCpLdQYgbVIqemu6j/e
 M+A1nbysKCve7iDjL3pDYVPEcA3EeBBCnogWm/p/dv4Fyk6NyJjhCKffshpxK7npjka/c/HNL
 kmj9MznzW5IUJgBUaFIt3KWGfHRjGBB1nHTa8yQaAG11ubPL2pdbZDeXpJ8uPfqxFo1CHuFNt
 hrexpjuPaA7LquU4w/MO80U/TSpm124mBhwxY9jmS8A7gKZHVL4IiU45Vz2pTkOpdzQY01ey3
 eH8hRLccM/m5/N9eOTNSP7pR7Diu12YA9blMR3c0+T7QyQCxC9LR3mqo5fAopH37uC4oq4p8O
 5TS1uyQnQlp5Uu+RY/LGHlG4ID5kCdBTpJ6/JiJXC3o+0VOMdAe1d2sMDUEcJKBwQpKsQ7SkH
 Q2sE1wNl/qvdWwUGiNDajjKOV5jAb24s44OBopzTGHBf00blcnurv8Q2cp7OaCXyCp9W3q7KC
 cO1DW5p+wSDFTkzGJqZXIjRcWcRbBWVALbTs3sH8cczVZxRvFfra7ydEtJMJqbvVAchV1JEaN
 OczzYheBEVWnvtDgB8CwNLyduQHUsWUl1vWByXPovSRKUjiR2clNidr5+RNRwLlpkKgjU4Z9f
 vaireKzmPEsxLkXxdTBq48PPwkL5ddUonAsstEXQt0jOCquVFjgVKPmooio/yNsLKsqJSEYjA
 YMt7zASGrJjmh58R5INxwsygiEIYzVGNlismh0hiq3zpBTegNr8ZIL99zUF1QdhulXnQg1t9p
 QNgItIY4oFc3SUiNmOxTPkIdlzIMAchGf98PREGV4kixWQY3e0V6SqTLs179jo3iXk0qLVwAS
 QZb8s3do7fo6v3L9d6Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_052556_081273_CCBC0376 
X-CRM114-Status: UNSURE (   5.92  )
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

>>>> Can any other summary phrase variants become more desirable according=
ly?
>
> I agree with Sudeep, the above sentence is completely incomprehensible
> to me

Can any suggestions gain acceptance also for better summary phrases?



>>> This is meaningless, sorry can't parse. Ignoring it as others in the
>>> community are doing already.
>> Do you care if the term =E2=80=9Cnull pointer dereference=E2=80=9D woul=
d be used in consistent ways?
>
> ...this is more comprehensible,

Thanks for another bit of constructive information.


>                                 but again I cannot grasp what's yor advi=
ce
> specifically on this commit message.
May the usage of abbreviations be reconsidered once more also for such mes=
sages
(in presented update steps)?

Regards,
Markus

