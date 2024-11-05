Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455C4D3176D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eO2Rc2ylDy//zWsYbxaCN7+Jb/tGlO2igB2V28DpRFE=; b=1CNiyxhVaK3ou7yaHKKRdmsGL6
	yyWUoEwtnY9Gc+E5chEWJuVGGGgjOrLmI3CEn2Fpi56s8iYFGQ/XTfZ2b5qUp/PNW/C0FfQxvAPRD
	/5cgW2qdGeDkjU87H/e2pU1OTxpQUjchBmVY6ZcwoKt+h2mfD3TvLgjE1fDGp1FoO2GP5freVFCvs
	VpTGOlHr3QfEXWymDRj7ZiIYD51HFqwEF+Fv4EF4lZDj43cBOe/iwOtFDeH7R81MU77Z+nMCoMz8y
	6FZkC7nHB420fsPsxjPstsXSxhsMTTpkuhscex+XmsG9Nhog4ggpalakCCOjAqCYqClTP0LJnhXKU
	Q5UnZQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NNs-00000000D0A-2Fov;
	Tue, 05 Nov 2024 17:30:28 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MgZ-00000000676-2NQP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:45:46 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539f72c913aso9207549e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 08:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730825141; x=1731429941; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eO2Rc2ylDy//zWsYbxaCN7+Jb/tGlO2igB2V28DpRFE=;
        b=fceYO2WuzwQR6Y3CyhdpFpUSHJZkOTPbA8krg8prsBbaBpoLWufxTFuEeda8tD8BhJ
         iuHDb5qabZLi8DatT+3WqpKD219Iue90SKEAOfo0sycHzqXa/IzCtnWHHTu99kNXsm0I
         E0KTawuxKRFrg9NGVTHkOGb94/kVpWgn0PUffxK3ge5jCoJ4ginsf7FjxJH/WbeW7vGj
         vui/qdoBLK+5o0OJDoIbi05ADLLVuZIzUsKPTrW9nTB8MiaYtTl6tUW2z5HuFSsK/an5
         ffbqi4XeApiJNprESlUdaHcwm8hpM42fkNqeL8+FZ/9jo1W7bfaj+BtpRiW6F98zmuLx
         0Ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730825141; x=1731429941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eO2Rc2ylDy//zWsYbxaCN7+Jb/tGlO2igB2V28DpRFE=;
        b=drLWHSyMg3JVNcyZN2BhlKum77hFmaNfMVS4eFn2pyAumht3JnwpXPUc19S8xKzbUZ
         KCRN+p5K8ZMw/AWFvRaITNqEmXcPhIAyJ9JO7EYe3M3d2sLDCj4AClDqTl8JwqXjjavo
         AesgnzH3wJukuhF20RSCS55uD8UTW5g9Jz09c4cDrRfeI1Uo1KjwjdT4jTtjgg6f9Yja
         3MKxV0jo6+KIqVXw+liK5ejwabT3XdQu/2uVfomSwzDZP76vB0MmoXnBZ+VLkyU3jdqM
         U5AWQFCpwOZUV8c6hi+Nzf2a9PNTEtcAdboHrGQsaAbv0Sdf+w1B/KK96feJ7hcLmd+r
         ha9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnKCmPNNzHLygU0fuUCFCwKFgCE6WUXuquemigSKm4FyyHOYwWyVDLZoDHkO6p/PwABZh5Zn8iULiEiyVkI9+p@lists.infradead.org
X-Gm-Message-State: AOJu0YygsNm/Vn6P8tyyaTXz5IhXK0yY9eb8pYafjHHMdyDErCJiN/Zx
	hnhHqOsUXAXKdbLS2SK1pCe+aOm1W6P44gVjswEYkZj2AF/Hn3UHwb7DgOFGUh0=
X-Google-Smtp-Source: AGHT+IHbbL60OFoSRKrDaKJLcmCLmCs0FTzW4o/g/NDSmkrMXRKBjyIAqB/wjh3gYIeBgf3U9lFeTQ==
X-Received: by 2002:a05:6512:1307:b0:539:f886:31c6 with SMTP id 2adb3069b0e04-53b34a18f24mr19234091e87.38.1730825141265;
        Tue, 05 Nov 2024 08:45:41 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d698055sm195385765e9.40.2024.11.05.08.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:45:40 -0800 (PST)
Date: Tue, 5 Nov 2024 19:45:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] media: xilinx-tpg: fix double put in xtpg_parse_of()
Message-ID: <372abe0b-fd67-4498-883a-7139632ed43c@suswa.mountain>
References: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_084543_680812_953A75D4 
X-CRM114-Status: GOOD (  12.61  )
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

On Mon, Nov 04, 2024 at 08:16:19PM +0300, Dan Carpenter wrote:
> This loop was recently converted to use for_each_of_graph_port() which
> automatically does __cleanup__ on the "port" iterator variable.  Delete
> the calls to of_node_put(port) to avoid a double put bug.
> 
> Fixes: 393194cdf11e ("media: xilinx-tpg: use new of_graph functions")

I guess the CI system applies this to the wrong git tree so it says
the of_node_put() calls are necessary and it can't find the Fixes
commit.

regards,
dan carpenter


