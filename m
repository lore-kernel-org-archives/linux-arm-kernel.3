Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFE6EEF33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdgzADYdSTQF3KpHo8SgQF1RTtf2xICHD/S64SaK5OA=; b=Wk0GmZtzyUUqmtmjd1LmZgL1Lw
	DVWJ0GNe3HnXTUqXZ9NHOP8pHGMwqAkw8qYL9sA8qXuhCY8bqj6sQc26lwE+Fy05tDwQN6XnRBHf3
	QF9vMz6x5kjH+3dnB0JdMd/k76aer1nPdRvmyeykisAGj8l1+JeD3nN+nLMadU6YsKu4iZaiDbQOI
	BnigLPQ1W5EKvFzsyW/k+RHa93nrwlG4Eaf+6bsZNaCgis1OIB/t+feXN70uDfcG/cj48pqupMEhS
	Cyph7b097I3FUZ9kfIWfB/ilWopGK6TV1z+UAuOQ1OzQmL6p28FXbFQj3UPRZFfwf1EZE9WcvbTl6
	4MXaieWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4hT-00000001Jb5-01q4;
	Thu, 05 Mar 2026 09:08:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4hR-00000001JZf-0lWb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:08:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso70604395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772701731; x=1773306531; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HdgzADYdSTQF3KpHo8SgQF1RTtf2xICHD/S64SaK5OA=;
        b=L+yUAz+pgsx7YT2+LvLjt+vKj0w9e0gEJ7un0N/AiHy4cDOfO/aWEicU4MKCIr98YB
         8fIais9BPXr6LzU+sRh8C7Qum7a3+KcycO2zRAaKyoDTzomN5gBJEeO/16EyT8S4fsIa
         13bnPik9IQLzHnNKMoljxYLTDHMcbOn+qODxyhAmwAHQKp7FwVf63G8KOlkLUAB5OKh1
         /bg6MJjaVR1/KpN+OA7JH7qNIwg8ifcX47ygG4iG4PyDGQ+yk1Vya79ucj+agkxOJR5v
         CiBO0WMrkKnZZiB8ZAtuBKtCi7VNYJ+F4C6r4/P+QEItKwTUA7TNm5GRGapIHL+hYllt
         4rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701731; x=1773306531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdgzADYdSTQF3KpHo8SgQF1RTtf2xICHD/S64SaK5OA=;
        b=FZ7nkiO14Qw417rSoMvnEqNfdlNPqzBTkX/PyTkrKfQBZUvZ2wHKaeJ+SZC+2i9aMG
         3b6ba3ttj+JiktkUSAHgLCcIJhYhu1GVyNxgBY+hFIZTPsTJ7XhmK7bZ8jduJ0Mq3y7l
         1AnqoURu3frc37sQnRovVde93mYUUu9eb99W1oIxUmMI2E3XeXqWaHz+MqZkq0Ot9U6v
         rlDfRB85+tArERx4/Gh7sY0Mf5f3mMY1mFoMNU8vqTehBk0j+E4aHY/M1pvBm41LhYTd
         Fsl1oSc8SzVTzY5cczghYIR6UdFWnYEib7inCz4oaIpB3S0obsaE+F1ofP2k7rTkd3Ze
         6r9Q==
X-Forwarded-Encrypted: i=1; AJvYcCULRfi+AS7r/Lx/khrnXpC9VE8aThP2ZfkO7A9NxMLgG61fNgvWBagDlemV/AKvqLF5zEn4K4BTKq82rD54UQGG@lists.infradead.org
X-Gm-Message-State: AOJu0YwX0fhu5l6VkUIONh5mKyKDpMs0HLnitaigxDHBV9UTV+kNaD94
	Wn19Z6JS238zZ+3Sg9J0DdFo2HcT3Cs1sbO4cq44V1Dbsk659rS0/kT1
X-Gm-Gg: ATEYQzw0B3RekKEZWpuu0sdxl6RSdR8KeB/esGuI3ouhEvyAbMLebJLW9O36p2ErE4U
	rWtaiwl25PYSKAbJFlGzrSIVw/XahNxk1jyh7GTUglILVMAMexK/9pTm+1r4f0gIGDinRDc2hgi
	rAz6HgXKrWCknDX2EQmanPUy34aGO7IpruUfGULUGCgtRJ+QuAhnCZBVrAygz7VgAUIU1bfYyOs
	erZwcbD5D3vrItoMWDKQg6qPWumd+kBTEeost+9jljCMWQTafLhMl0dkxOAzTEina2byEvYweWd
	S8tDrvUlQGZ/iU0o18yyn9Q1f9fKpvLyTVpc0ocdncN4CMakUXidM0Ip3vjwFH798SmJdKA0W7V
	TyoxftUp0coUTMd3MTtX4jfz6oOdyedu7hGrYB/Tty+QaK8Va7zQdk4xyCeIigVdUzHFXYaoqYg
	O4v2diVlUSdC4BK2bOc0ZzMdzlJX2ulfcjbeMhfw7u4KwO3uQlbaxbRloS/fDzXezD1rZ58Kr41
	wQODFglka9yVaZHCm/qyF8f7i6XZGH5iltsUWe9AETvNt3okW0mDzQZI5kGmKZrQ6VvuP7Kxw==
X-Received: by 2002:a05:600c:c173:b0:483:acd9:bd18 with SMTP id 5b1f17b1804b1-4851983b401mr89134325e9.1.1772701730851;
        Thu, 05 Mar 2026 01:08:50 -0800 (PST)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb33815sm52248885e9.12.2026.03.05.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:08:50 -0800 (PST)
Date: Thu, 5 Mar 2026 10:08:49 +0100
From: Franz Schnyder <fra.schnyder@gmail.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca, 
	benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, sebastian.fricke@collabora.com, shawnguo@kernel.org, 
	ulf.hansson@linaro.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, m.felsch@pengutronix.de, fra.schnyder@gmail.com, 
	linux-imx@nxp.com, l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: verisilicon: Fix kernel panic due to __initconst
 misuse
Message-ID: <cq7xvy74ore4wqkdarf2p7tgksrmfdaysajqga5ymrdkklwa7p@nrbu52d4gxe3>
References: <20260305080354.639-1-ming.qian@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305080354.639-1-ming.qian@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010853_239217_9546EBE6 
X-CRM114-Status: GOOD (  14.66  )
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

Hi,

On Thu, Mar 05, 2026 at 04:03:52PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
> 
> Fix a kernel panic when probing the driver as a module:
> 
>   Unable to handle kernel paging request at virtual address
>   ffffd9c18eb05000
>   of_find_matching_node_and_match+0x5c/0x1a0
>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> 
> The imx8mq_vpu_shared_resources array is referenced by variant
> structures through their shared_devices field. When built as a
> module, __initconst causes this data to be freed after module
> init, but it's later accessed during probe, causing a page fault.
> 
> Use __initconst_or_module to keep the data available when built
> as a module while still allowing it to be freed when built-in.

Thanks for the fix. I tested it on our Verdin iMX8MP hardware.

Tested-by: Franz Schnyder <franz.schnyder@toradex.com>

Kind regards,
Franz

