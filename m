Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C97C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pT8QHmdIgh8C/99Uph+9sWbsTLGNaTSQ6OcKusUcL0k=; b=FNIpzCL7emKD4m6tHHbOKRb/Xl
	GQyT6i71wNwQ7JjwwGEbAUvqDhdY4zfsvfwFxjeIow+MizFDB5aMCuSZh5/prfjE6SJmlZDwhqoqu
	mnkG1VFeXAjuAFmyILHgXaJdPF9ER77PtEO/Fz9vkV7aqCAkeCIvxpFAFpVnvg9UNPJyqnupmEQRz
	Ko6VcvA1t9trfRuf0gIIb6eE+LzD5HpiWhqOtQ4D3ifyuoJfYgDfjbkfw4oKlhp1JcCQZNo1fELFg
	1EKomJGzwqWMnIBIXtb/XoNOkxa7kDzt6E9lqPgYibPbOessZOYK+rFcK1WyFIbnQUuisq5V9jJOU
	WY/Ki08Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVKu-00000003cfy-09nG;
	Thu, 27 Aug 2026 08:19:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVKr-00000003ceT-05Hy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787818782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pT8QHmdIgh8C/99Uph+9sWbsTLGNaTSQ6OcKusUcL0k=;
	b=ZQossVzUDsQ+vVemwjvQ7xYZwIW9Z8Y+2xxXDDTppueh9GCRwlWdgSJcRRPKp/z6gdm0vL
	QgQS9ZQjaq8nEZELPsqxMLe0zM/0Vx+KXy/+O++qmDPibuVngYEZH+kA871Udcxj3ECeT4
	Qivv3llDFK3a4ep49en/a54PPePu9tA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-J-2aCw9qMxmYrS9FMYesFQ-1; Thu, 27 Aug 2026 04:19:40 -0400
X-MC-Unique: J-2aCw9qMxmYrS9FMYesFQ-1
X-Mimecast-MFC-AGG-ID: J-2aCw9qMxmYrS9FMYesFQ_1787818779
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49b64e98e94so2717385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 01:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818779; x=1788423579;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pT8QHmdIgh8C/99Uph+9sWbsTLGNaTSQ6OcKusUcL0k=;
        b=Q0mdQAWBCjNEJGyhx2YQzmLdAA7RLbkzow4vX3tA7ubo7GIE4d3bRd4UftPQ8XKe+n
         KU7TW6Kxga75mca7MjnaDXDjkIxZb6OtrlxnNjmqUBnDRrMyk2rvayfUxXnrduazmWmx
         pvnAsmIHxJfbY5CjTQzn1E7hqpMCtji/K3KR7YOQ1wyUh16hqQgcDvn7gebuQzHPovAb
         JawIIUnj+C+uYmZ+nygLI1KwTIjcOti6MdhFlUi9uzdDHUilH78n+z45y2nK/1gouwM+
         CTYkky7JIKg3JhAbi2bHfR0Sv+GjP6MwZ0dr8+n/Xxzo42gBfWNIWChZNcduTQbiZqby
         t32A==
X-Forwarded-Encrypted: i=1; AHgh+RqPKXCUJIjaQgBdYcoiPV8QZgFv+biOW0cP0eNttVxftbBmtXE3Sd0frCSdNn+LMifp53CL1mAF+Yonml7syMie@lists.infradead.org
X-Gm-Message-State: AFuF++l+bKgcp8JUxa5D7zLqH++6oIeBTAM0HY7H2q67ug6IGZ8UV4pv
	mmMaQTcykMUwcINgq3gvjJkEAjuvk7Y1yQsuNh/81ecY8AD8WJe41g9EzOJijjHfI1vfO4jwBwj
	rFId1wXDepqjEorZDlDUeUeR3PuFqhTE2gIa008iQxY/BtUdkgxoB+rwIvBBCqf086PHd74e/yt
	Q6
X-Gm-Gg: AR+sD10YG7yrdx8DrI3h0Tl/P/CyWleBs9mbF/Qda+Oa+Cj253f7wHwpRgBKnCzLQpx
	33zQF3jELbJShWqrA6kvqLjqTuii2v+pDNCfFLs1entB6Cx3YSq19B6rFYX9UsnKoekYixLpL/X
	yrwW+HGr+f11NdwlIRd1VHoFGGJ4zJ6ouADKAWq62vWBe7U92mrgmWuWYbqPGMMesiSzaYQzYJ7
	3rgS8yaQhaY1xXhq++0R2+H7ORqCAsskXd+xL9JUyiDA1fHJfO++Zyqv0/o29mTI/mvZlTO9EWJ
	1eupZ9Lz9Pwu6QxkgqPbllymqYZq1MTL9CNIcXdIF+ACCm+vZe7osNT5D7ly2gfF9T080DAZs8M
	BMiZIcWt5SARm+u/92MBF9E2QXsjdN96zjHvsqsX4Y+azBJvcavZpZqXU5pm79fcT7IaP3LM=
X-Received: by 2002:a05:600c:3b25:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49b0dfcd4c2mr46298665e9.6.1787818779472;
        Thu, 27 Aug 2026 01:19:39 -0700 (PDT)
X-Received: by 2002:a05:600c:3b25:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49b0dfcd4c2mr46298095e9.6.1787818779033;
        Thu, 27 Aug 2026 01:19:39 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b0dd3e148sm29013275e9.1.2026.08.27.01.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:19:38 -0700 (PDT)
Message-ID: <ad731f07-3b80-4d48-a6fa-c0e405eedefd@redhat.com>
Date: Thu, 27 Aug 2026 10:19:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 0/3] net: phy: mediatek: support EcoNet
 EN751221 gbit SoC PHY
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org,
 ansuelsmth@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260826202103.2280645-1-cjd@cjdns.fr>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260826202103.2280645-1-cjd@cjdns.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yyrh7PNut3DFWFgOvLe6Qygpesy4sNOHMCaUGy0Gaik_1787818779
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_011945_138694_9A6B0C24 
X-CRM114-Status: UNSURE (   8.26  )
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

On 8/26/26 10:21 PM, Caleb James DeLisle wrote:
> NOTE: This patchset bases on https://lore.kernel.org/netdev/20260708102341.53919-1-ansuelsmth@gmail.com/
> 
> Add support for the EcoNet EN751221 SoC gigabit PHY, as identified by
> product IDs 9451, and 9471.
## Form letter - net-next-closed

net-next pull request for v7.3 has already been merged, and therefore
the net-next tree is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed



