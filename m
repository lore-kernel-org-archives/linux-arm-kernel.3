Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37C1CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exD+n9lmOs/QC0XvF7bmTazq5rd7UWP/ET+yH1yUt9w=; b=FO+AcayeVVlCAoq38xOiShTcVg
	EJUQOTA0bVPvDY19NgSS85hkXbeZ7mcBgUiybSLtPl5vRR5t6+KFwHu1y4hVqz1f9q1DC8Pbn/I8P
	33ZirGmp25EUV5bvoetNkmUVK5q/2H1xOrgxoUatkSVHywS7/CjVkRCbly7WiBAyUebNRU4hR/3NB
	GI6zjHQSpAtO03o25EKYC1js1JvCtnNynVNc+LqWV1ea7jm32iBZnh0iFm9mFYDfZ6vrZ/krUTgqt
	Y6CuZB6piCu5cR+t1njc/zqFbAH2ial9NL9TqDn3cSo2ztE4LDqXwLksmYY8PvNykVK6K6WgD0S0z
	l/t7fCcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28NJ-00000001WGS-2HJI;
	Fri, 26 Sep 2025 13:20:37 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28NH-00000001WFs-3kHh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 13:20:36 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-8c62e313847so83812439f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 06:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758892834; x=1759497634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exD+n9lmOs/QC0XvF7bmTazq5rd7UWP/ET+yH1yUt9w=;
        b=ZPscAV++4YeZ1pqfgcoeQYqI1Z5XFUXlOeQHnJ6wMk++kiOKDlGgF3too/NqT8BW5z
         gcY/uf5NnUGFkVjPu/Yf5DZBWgArEdxTjJagY2LZ9EljFtRRYT4uNQ3WZDfCij7u+FMY
         jpJUr7zXCSM7llgrP+bjQJyZ1NJJ6m0NYZj7vRqIzKCrOSyfYVZZLvaEBHBTA3/961cz
         gxjrg+6A9H9d52ajWwYIVcoWav2mR1zlbwHX66Z3OnCPYnXmsESYd81Q5MrzMYnNtmvi
         JFh5QTlKFqHGMdWep7T6g4Dix34jY9VjUiSob0CSoOZXCUDj9W8VYCrpDAxlODj7Y/Ze
         yQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892834; x=1759497634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exD+n9lmOs/QC0XvF7bmTazq5rd7UWP/ET+yH1yUt9w=;
        b=aYrhHzrCJ6jRpIhxGZnpn+7JLD9NEt9LvmNvw9E7oGur9atU/dRt2gNnIj/hRkcS9d
         dhRLdLYD1th6907W2TELakGYNeV5DA+BzLduigF/p7Q3pQwbjlnldCvhuNUYxS4IvAsm
         +LMKnWMshICbLj2i+IFi4zAT5+cwAKgoM/+zWpxu3x4dIBUd4u96R3Xr50+JiYKrQ74L
         CHJMlw/H4YIufON8OaIDZleSBCiXsKAafT2efWKHFQWEVlc+u12d3DWEaKrkHj6Rol6H
         gEBKTkWK01dnC0lORnbwHfDNOe8zoBiiWaq1Hxmz36BgR6Jq2U5t8UqoByS58Hr5SaJ5
         vmPA==
X-Forwarded-Encrypted: i=1; AJvYcCWEM1T+NHAY9jgZGcTbpNdTIzSdn4ZmugDsUNLJgAt3wrJL+R/OeW7Cx58DxDAHCh9kfOPiwK5NdpvqCyzPWeWb@lists.infradead.org
X-Gm-Message-State: AOJu0YxF7ewAGLto6ktA+lhC2K/y4vRTWNA9mHMyom269i+m1Oyrcbb1
	sFeiIpH5W0Nt9Z6XKEHHmu2m/fKo8bGuCyFIaiJe5/rmG1mMANND+C24
X-Gm-Gg: ASbGncsYMY2a/U7ZiKoBDxK2eHKkoqmv06Aw1pLWUCAravjCAJJEopqBdffiRXr0WtQ
	6GCe7HppkkiTvgN91Cnlur1g+ztZ1Sx31NrXIFAl9mWbeIL+1Dbpyi45b26s+VpMUQiX3GPkwRm
	RfXdzTiJV/A1Ihv/ZVsvAWkLaKL90lkKjUn+jyVWbdrkInnf2XM4qLdmtgX4HXiv7GMgDXgaJNJ
	T1y0OyoZHF+dysoCim28m0b7p8J+epnP18CABXXiZGEGuYkvb2Vg7t6dbw49MP2aTU28CdGiMdZ
	pYZ7qZERqQWDYD+o6qLyry5181j9Ca4uf9kUmtEFh9lYRYscwSLDOMNI2tIZecz6WKbSx4LpjdA
	pYh1pdWuMbvoNb6tSHe0sv7ctMRDIcYKC
X-Google-Smtp-Source: AGHT+IGw0hM3Y3u9lAh09a4zFHGUlC2itz0RPoBCvFfYPn3BgjYRBhn8aTwtmMHq1kvbXiw9yl1Nog==
X-Received: by 2002:a05:6e02:1888:b0:426:7dd6:decd with SMTP id e9e14a558f8ab-4267dd6df15mr70598545ab.28.1758892834356;
        Fri, 26 Sep 2025 06:20:34 -0700 (PDT)
Received: from orangepi5-plus ([144.24.43.60])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a6546199asm1835028173.25.2025.09.26.06.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:20:34 -0700 (PDT)
Date: Fri, 26 Sep 2025 21:20:16 +0800
From: Furong Xu <0x1207@gmail.com>
To: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: tc: Add HLBS drop count to
 taprio stats
Message-ID: <20250926212016.4fd369b0@orangepi5-plus>
In-Reply-To: <20250925-hlbs_2-v3-2-3b39472776c2@altera.com>
References: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
	<20250925-hlbs_2-v3-2-3b39472776c2@altera.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_062035_934767_F716F0ED 
X-CRM114-Status: UNSURE (   8.31  )
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

On Thu, 25 Sep 2025 22:06:14 +0800
Rohan G Thomas <rohan.g.thomas@altera.com> wrote:

> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Add the count of the frames dropped by Head-Of-Line Blocking due to
> Scheduling(HLBS) error to taprio window drop count stats.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

Reviewed-by: Furong Xu <0x1207@gmail.com>

