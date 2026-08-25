Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FAEC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 22:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2HRqo0BNmOG+wvSL71FMHVkpYIR+F5v9R73Mp72HJs=; b=Fvqo1CI6vssuRzWdPS/nkjctxX
	d5D0BCeJD9Tz8poTRgwbiMZHG+QSyJoYAjeUPhPcgxMYstQwisy3SJD63F7SxUTXdNP7XCEJbsvn8
	wyBL2ZBFKnuhOBdmN0SYivxxnH2yaCKSMWZJ+4mM0PDb7lR3wKbJ25pFqPPA9pJWWE/ifpNhW4Mm2
	QcLIldctbRNL1vupAIesV++Yxp1OpWMAPDvz69HDa04KG70NrFTw1ly/6yJJ86hrAom2cgq5chGOG
	tK55y1qVzXJuWMs84ErG8kEuBU+Il12f+EqGd9NVKnguKyq7Vxz+uF7OwPnrPAMRM4eBdtlVKxpM+
	d094/8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyzIX-00000001ZY7-28OD;
	Tue, 25 Aug 2026 22:07:13 +0000
Received: from mail-pj2-x06.google.com ([2607:f8b0:4864:39::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyzIU-00000001ZXg-0vvi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 22:07:11 +0000
Received: by mail-pj2-x06.google.com with SMTP id 98e67ed59e1d1-3964deae8a7so129495a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 15:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787695628; x=1788300428; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E2HRqo0BNmOG+wvSL71FMHVkpYIR+F5v9R73Mp72HJs=;
        b=RhpDvmv+VTvlVKoZNvSoVYsk9OJem+wZ4fUAJzMu0oCDOQ7KcO/L1pfdZBRMCXqKXD
         VGzM47wz1miXLCvz2ENibPjCQg9iZkxp5E3fhMGU6YPGmksKBzrbJEHOLO70LVH6p3dk
         DmFGNxwSHciLpcNwG4Z26XylLs+hdlNW/Y7s416+u1SLkXAR75ipP2YqCn3A4oN7WL2+
         Wzk3N1fGT/xNNEnCXOxn2BKwZxPBSvKpBetFEL49b2EbuD2xamMPdwPxtOO8qXlIeNJu
         tyCKJMP0pW9js7fS4VnaXl/p8zwUuyJae/5i0QU13sIXEFWFe8sVmYwlrSPo86v2uBDL
         QkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787695628; x=1788300428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2HRqo0BNmOG+wvSL71FMHVkpYIR+F5v9R73Mp72HJs=;
        b=V3Ti44tW0wj5w8sdLROf0ZIeCPCwCnbTyaosZAcbhh44feaR15NNSO7Y1AiY+cus93
         Z/ioEXSi9vmx5e63v3r+rTxId02Xg+oFFvUOl1bDpzm2Ed2QZ36IxCD9yNAcTfNeX1Rd
         5pAq8RXeVnwkOhXlVsIH9gZCql2h0lpYkC9OkdN0zaeEwxI+JhOaJXTNbUev7wqZf2gi
         hQCz5L9nEamOpL/VPNPtsxXT5hdkluCxQ3rbMfYHx3KxKHyVZHWUCGQFm4kJ2cpoO583
         K9QYwMabDgmTF7L5/YLEjv8VmUxk6Xgbeahc4f3kUqyFYl5cNC4EBjpAGa+42ejJf9yk
         0DFA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5YAy5KgG9p+UzdQ6q6M54NNzJiE7kT34e5i8R2dbo7CIJ9cqRJv2MO8fMy53mdIdl0Jy2XD0C4rd1BEd6cqJh@lists.infradead.org
X-Gm-Message-State: AFuF++kWVgSVBaxBDHgHcDiQckfYz/nXnctZlfFa8tFLFFJsq6aP4m7a
	JO17u1+lkPeWeWDnxmmwAQnjfy9Fuvkzs7EmFeo3MsVrJ1vEQT/XT95z
X-Gm-Gg: AR+sD10lJ978hsGVWK9g42jvtvZyQvYmpP9EJ3idCB9F176yGtzodtDIVfL2r5ivL5j
	IlIiUWP1H/m+UTDPJO2eU6LVgmh5L/4UJ8uyME+bGGqkIGGrCtchL9z4QQ8wqrX0vNvUtVFb95I
	QW72+6zzsH2ydLA72xjAXwomVw1lN3pK8Oi4lWsNYLG8HC2A50XYhxNIJdaFPaGb5/SGZgk5tse
	7NgKc0UVONEA8RjmJ/guc4cGIQIjj9DPb8I2STnyDpV8mE5xMoArwH6Hd/kDD3lu76Fex21X++h
	3JHK2NQPlbhZ9IGIg/RMdefcnnTj+jwwBP6aCJpOGAhOeR1CW4byWL7/MTyZeQwyEp7stipb83B
	ay2AI0lgMDFXbVieHpfg7SnrEWpO+iTzP2WUF6m58s6tVkcJ5C5ydEx7FsGcjI/VkUyaroxETKc
	BIN3n/iY/s0J/sQH8EHRyn8WMLOyGEVV+lWfRp0VditcT/qKga+RF7FgT74cg1B/Rv
X-Received: by 2002:a17:90b:3b4b:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-3966d8b6295mr4351538a91.14.1787695628197;
        Tue, 25 Aug 2026 15:07:08 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:46::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a57396sm1314425a91.13.2026.08.25.15.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 15:07:07 -0700 (PDT)
Date: Tue, 25 Aug 2026 15:05:46 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, 
	saeedm@nvidia.com, tariqt@nvidia.com, mbloch@nvidia.com, 
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	aleksander.lobakin@intel.com, horms@kernel.org, magnus.karlsson@intel.com, sdf@fomichev.me, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com, 
	guoren@kernel.org, dtatulea@nvidia.com, witu@nvidia.com, martin.lau@kernel.org, 
	yoong.siang.song@intel.com, intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, linux-csky@vger.kernel.org, leon@kernel.org
Subject: Re: [PATCH net v3 3/3] net: stmmac: document oversized AF_XDP frame
 handling
Message-ID: <ao4RsulsnIEMOmiG@devvm7509.cco0.facebook.com>
References: <20260819160535.1472459-1-sdf@fomichev.me>
 <20260819160535.1472459-4-sdf@fomichev.me>
 <aoceSoSFMx69Z9up@boxer>
 <aoeoJ6-njBxcWs4w@devvm7509.cco0.facebook.com>
 <aogpDsa8hz6CPpD3@boxer>
 <aoiIarzdjk92RkCN@devvm7509.cco0.facebook.com>
 <20260824111443.34bffe04@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260824111443.34bffe04@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_150710_552750_19BBCCD8 
X-CRM114-Status: GOOD (  20.64  )
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

On 08/24, Jakub Kicinski wrote:
> On Fri, 21 Aug 2026 10:28:47 -0700 Stanislav Fomichev wrote:
> > > > I do agree that a better idea is to probably do these checks during control
> > > > paths, but it's a bit more involved (and not sure if it's possible? if we
> > > > have a bunch of xsk sockets and we change that max_sdu, do we go over all
> > > > sockets on the system somehow?). My main motivation with this patch was
> > > > to make our LLM reviewers less chatty about preexisting issues.  
> > > 
> > > I hear you, however I feel like we do not know this driver too much and
> > > probably we don't have a HW to test out such changes, so maybe let us try
> > > to fix existing behavior?  
> > 
> > Let's definitely fix it properly if you have better ideas. But since we
> > don't have HW, I'm not super confident doing anything sophisticated
> > myself :-D
> 
> Let me take the first 2 patches and leave the stmmac for later.
> I don't think anyone involved care particularly deeply here.
> 
> Maxime said he bought a bunch of relevant HW. If we finally wrap 
> the AF_XDP tests into driver runtime he should be able to help us...

Sounds fair, thanks!

