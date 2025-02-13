Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E8DC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPPXp+DqYBNPtUl0nhKlU9ascHyp2ZkvND5NvkqHXIk=; b=aic8fgEqRTNfCmaBU1he6/DSw9
	sonl4DmIu8ESG40x3BklQhLQlLBYn0uGZo+BYT6m+kABSG7y0yoMHmB/1y42NqRXf0qSLdwg94PqR
	76ZTnPquN/OVp6Kl2Xj87uZP7gMqLix3odHEWgXNo/DVG9WvfmhowQbYYQ7epfMzIV7T7VdEPlmMu
	xyzMpZFOmC/JXg471reRoWY9G+1nEB55E9N442GzIzIEEiP8hBBunGBUOmNZ/RROUfEbQYmTi3bTe
	ImrRR7ZZcujChqPKU5LfiskJseeb/JrgUFmrBz3wmn2WKVldUoKGO2vkR0Alg3XfNYojA9hL8PMYu
	f5t+HZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVJo-0000000APna-2b68;
	Thu, 13 Feb 2025 09:15:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiV9U-0000000ANZx-3KXw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739437495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPPXp+DqYBNPtUl0nhKlU9ascHyp2ZkvND5NvkqHXIk=;
	b=ck6dZ29S2SdiwZsf4VOz7Cgg2dRswiCUzHR24yaEOAnusZFFUI55cLsERAG9VVbByICDXe
	MAoUOECRPa67+9vi1b+vJv3bNhtTclLMh8DS1QdapzjqZMC0sffPWNMLOjPXhlbauFxjGf
	bHjgixoxpVxRzYAYHbr5JJFt9pdDG7s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-Ky60ulLIPJ2QX8ej2VEsPw-1; Thu, 13 Feb 2025 04:04:53 -0500
X-MC-Unique: Ky60ulLIPJ2QX8ej2VEsPw-1
X-Mimecast-MFC-AGG-ID: Ky60ulLIPJ2QX8ej2VEsPw_1739437492
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4393b6763a3so3241955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 01:04:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739437492; x=1740042292;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPPXp+DqYBNPtUl0nhKlU9ascHyp2ZkvND5NvkqHXIk=;
        b=efZlO95tsFCKjrb7Lcl3iQ/QCbfpT8LdbgOy8FfonLF04KETa6wCjghVNhY+lr2NS+
         pJu5g7Xz66tQ567YaR6WGeJGOqwESINhLCK/0YcCGxPb8cgaCSSywQTYq2lKqrAdlpJ/
         3jzXZL4by7swHLDPEcTKsdAMzn8+ADruROxGzMN9I4LPlnj7aI7YyI+j5CncM8r0/WW2
         3IgiY70eiqZmUIddwcw1O+TVgmKh/7oQ0oNS/lNrmTIwySiWacG/xE+OQT/iArwFGm4y
         uYE1gPjzAZGE4avxYKhhTiK3mBEySCG9/JZNM8XoRnz29w/CBvssGtpGh+zknsHLIboV
         Hbdw==
X-Forwarded-Encrypted: i=1; AJvYcCXXMOM2uay7xrtaDNqZEx0sGEu/JcdzsvPeiVlLXbCSkBllsf9czkyY39dsYuEbGt7J9ZmCveDWDz+Vj/whiHx4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj9mMHBMU9cLx+2D/iMa3ElyXRZrl8YBtICLvPCDDc+ps8sIcX
	y0AnNycauqpdbTrqhoXVl2wIseExWbkQF1yTmvZhPCw+zj860kBT1emyRTWAylvqWyG1+dIN0hb
	xtBFb2orfc/gO4idCAH2ebn1fGEsnj0sz1tQylq7fDgM5xjK5beQwdE+BQ4Y6uPpZf8yHpjFY
X-Gm-Gg: ASbGnctfRy/u8ezxZsAv2rh9Ee0Z82Dfco4rrQ9iRoE/wrsd4I2XMyHPTdLndITEziE
	u9Jrj6H9ihjljh74BFbWyRdQKL80ncm48ySIakzVK/ouzcLHBackkzxDp1Jc8P7FQKhirAH4m3P
	yYFC5KZLHiVuJvYLoGoCPB/UcjS/28r1eKQpqjujdCdon31zhGOMUf8Ra9WUKSxJ3Ya1ncFdLm6
	MNaMV0vHoRSt6O+c1+ieY1mZtMgpSXNKoUhtNg2+e3jkjlOiMy/7kSO9orTp2TGc6xHozrholpx
	Fk/q3CLFjdmwaJXRNx/Kon5yYTJSNpMz17E=
X-Received: by 2002:a05:600c:46ce:b0:434:f609:1af7 with SMTP id 5b1f17b1804b1-439599258b1mr56603555e9.4.1739437492140;
        Thu, 13 Feb 2025 01:04:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWnvSDslS9x9V9t5sSHRI9c0hrSBXGtqBD2no/zOmtqcPI5lcyK+O8Y6XHZHX2Wk85H1SIZw==
X-Received: by 2002:a05:600c:46ce:b0:434:f609:1af7 with SMTP id 5b1f17b1804b1-439599258b1mr56603075e9.4.1739437491770;
        Thu, 13 Feb 2025 01:04:51 -0800 (PST)
Received: from [192.168.88.253] (146-241-31-160.dyn.eolo.it. [146.241.31.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d58f3sm1253334f8f.73.2025.02.13.01.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 01:04:51 -0800 (PST)
Message-ID: <a42ec2d4-2e4f-4d1d-b204-b637c1106690@redhat.com>
Date: Thu, 13 Feb 2025 10:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: ethernet: mediatek: add EEE support
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>
References: <20250210125246.1950142-1-dqfext@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250210125246.1950142-1-dqfext@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kMj9BgTBBIPzVRMaT2r5bPoERSXKMLZVq3p9qPJvgjg_1739437492
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_010456_906601_0EE00CF5 
X-CRM114-Status: UNSURE (   8.78  )
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

On 2/10/25 1:52 PM, Qingfang Deng wrote:
> Add EEE support to MediaTek SoC Ethernet. The register fields are
> similar to the ones in MT7531, except that the LPI threshold is in
> milliseconds.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

@Felix, @Sean, @Lorenzo: could you please have a look?

Thanks!

Paolo


