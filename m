Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3466CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Knhl1ddna0y+c4FljL/Lxt/HMyCo8T516/5MkE1l9I=; b=z5J+jZho3ydojeBNkmbHyK52hr
	wBSnZjktoKCiyBmLEOjothcenslWeO6ysXQPwfIxW2KeY+gB6tP2S/7JQ1OQdDKbHBD+fwve6CdXf
	PVIL/jEZkQUJwF7sgVaredutclfHba+YITmkIm9u/sdAE/QxjwaweT7C4KBeMeMfxGA++uKaNINjB
	TJAgmXn3peuUl6unyPCO/kO+qqXgD/EmgSIPaaOoNVlGgy5NlJSiBOibDHsnas/wBYqOW0l2GF4XV
	+u6HAgPKQRc4Pmv1bK9Cjf9XhRLJHC5D7WyBX+6xYB5VhOIl+GRH0Pk63IabXj5JATMrDx3zVmBoc
	8UVJyoxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc24-000000099wI-0E2Y;
	Thu, 11 Jun 2026 09:49:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc21-000000099ud-0por
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:49:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GGVK3863257
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 09:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Knhl1ddna0y+c4FljL/Lxt/
	HMyCo8T516/5MkE1l9I=; b=HTXYhWGELZhL6EGdTFiY6kPjdSwirLu9HgyPTmrs
	1U4qi4GjKUAwbRr9T4IZYp2pja6Ct+4Jvy9VTdwKMp4962mtaHYLWkuqmoAchmeV
	lU/PWww3BkhBgArI+IkxgVnGXhR5sJtOG8Ka4jLI8JHYw6kxxkyLoA47eb17qMEs
	BUKcpRHf6OH6q6GmS5/2TE2rqL01AVN4EGzJretpTwTUrkjw57vaBX5w3UILUmkp
	/NBVG9bWAZ7mUsszcuslcPrgNcgjEWpU8fEy14P4UMbkOwITXT/Khh9I2XmKAXX7
	zCbYWJSdUJRPxcIQq2+igmIWqjG3+uW+6vn+Nm+txDJJDw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjue2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 09:49:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842cb4c62f9so768009b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781171339; x=1781776139; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Knhl1ddna0y+c4FljL/Lxt/HMyCo8T516/5MkE1l9I=;
        b=RlbcFMLqhBkOmGGam/WLwadE4SAfsBf5D7DPfB0Pfh+jBkICpsV8nNo9N1Ovp+EwUR
         VMRxzOpNSZVRUlAB7aaeYQHv8nskfjhHvBEsVN4DIc1OSuKi+5BWOu3dzm5feByG2gwq
         xW2kW4dJ7N+mLyNN/eLRiS5a9yZPRufUSvZs4N1cTtz5TQakMhvw3RbzXZa5sJiBPHxM
         ZFdujspXVcyMFBmpfgWgozj7AgaQT85rt2rUt/HEsIhcw5ho9u4vWWo03GFthaw+R6XE
         S2hVt6Yd2zFMMeKsNk0GQP9EF12CdT96zYyp5C4GkdKF6zumgVAhCPZyNNNAQOzps6dm
         BESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781171339; x=1781776139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Knhl1ddna0y+c4FljL/Lxt/HMyCo8T516/5MkE1l9I=;
        b=R2oIEduwRfXoH3kdFfoH1v30kd+vyyVK2pEPfU6QBlkzxqTNj3T7EN+FJ5UIHjVQqf
         ZJq9dfpqQ+NZzjYO0j4pNI+XWhGM84hRWvqmoQWucEHih3NNQuIW+5HLVjdGI2Nv4ERh
         JCv7Z+ukL6mtzOQNtXJxjuqhFBTQw2ecPl9ms8MBd9SDs9PqToe4lI+D33HVi9o31Rbe
         hL95NexkXnmPckMleDxmBjEjudq1NrVsmt/CEmM6nsyQnmaoS36HThiULqlLoI5zIYXw
         EvxqV14GJmEO/aOhRo+Qhk9nx1wgWlUyxVNFIOnixyCt03LaLoOqvLl9cI6gc7ahoAdR
         w8oQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WzHBB41vPgFtq6tK2ge9j7yyIjE+dr0EcTDKmHNW/jHl120XmzSG74tcptoNuHcgJyobVZJGqRHAXSXZWEsfo@lists.infradead.org
X-Gm-Message-State: AOJu0YwDpuem7qie2Q9kmkQZgG2YIVhS76E2eabMhmXTdr7bB4vD69X9
	k8tirSJHjHGS08DySegkNgUDOcjwP3jvLYywgaCGLk527zJYdRwmAQc1Zo1hy1aQ5rLK0Ly1d2M
	rwwwuFK+2nFQqiyXQJYEwcwnffRBpHH5UkjB96b3IN2oLjk5Vo3cxaajjS++kWLHnY2AZdIzFrm
	J/SQ==
X-Gm-Gg: Acq92OFI50Wcn7gTHrbCxGcJIstLFjhrqzhuZGKYsBOJweZ5zyzQ2XBpLCdp2jZz+V9
	+sJgfQSDbkUFsbHvTFabq/0o8veqyc96aM3O2MF/DA6DQtS9kL1lEr3b+ZuzurcbAdhcjgHf1mK
	zxcjpnGTTk8+e/C7TK98ySU0fYLLbOKgOgO3Q6RHLT9De1yHDM3VbPK5MEwCYa5w1/znLExwRRV
	alQWdfO1Ob9nMwYrF4By259g9ZtFqNfSRmq0fsMmv7EZEkH0jXE/4rCTZ3y8HIJKEWsM4H499ET
	DAaoahg36Y+OCH9Sk8foHZe1k0HlEjAoPR44ugrayr2Lb+Yw/BB/1I0iRhBtQK4Z4fqZO6wt75R
	LtTXaw4mn1DGOAGICCROPcJiK8Eez1du0ChM9NzRh5L0mn7cwWcRLeQz2yZ0=
X-Received: by 2002:a05:6a00:32c7:b0:842:3804:590d with SMTP id d2e1a72fcca58-84335ca2a09mr1911948b3a.7.1781171338875;
        Thu, 11 Jun 2026 02:48:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:32c7:b0:842:3804:590d with SMTP id d2e1a72fcca58-84335ca2a09mr1911929b3a.7.1781171338292;
        Thu, 11 Jun 2026 02:48:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c9590sm1945195b3a.31.2026.06.11.02.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:48:57 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:18:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
 <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
 <aif8VS0pLYurFEho@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aif8VS0pLYurFEho@linaro.org>
X-Proofpoint-GUID: W-MW1X8P3QVHyTWJVi3JHRhLDh8alpp8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5OCBTYWx0ZWRfXwRBDbMYYj58v
 n2XPfXQU/AhB0y/VKM0diwVVnRkOvDZ9piuLB4++ScJl+6J/e2kAf4H6pa7SJdqy9Lsf5DhFnNl
 S+imcQ5aFkqW6Nwp40qWhllz0ZOAgpo=
X-Proofpoint-ORIG-GUID: W-MW1X8P3QVHyTWJVi3JHRhLDh8alpp8
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a848c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ot11TjGKcjkNMLPY8p0A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5OCBTYWx0ZWRfXww4ttUetOK23
 RXlf4DjnSCpj7JqqFJsa0L5joWrI/ODINUvHAQ9fvj04qxkXbO1FRknNNiyygMOj8OefqY3bBd+
 YQAcnzyOyDDm6ExSqMWwTVBzVaFzzcTTy/OlK/QnPVxUqSSDL0A2rybRHQTEZw+ba09n8U74/5x
 pl8pfvIqriXdwnDdMpAH/wy2Fn+B1oPcbIBGN01zEcq2uqtFqzsWsNa4UrFQTXfLhKeRl/GJrFH
 0dHcuBBJ1k8CcHgmlrF5alOrE59zBTNB1hOnnJ0YnF2pr9Qc6gitiR2MwOHRSBQI/mss/32zlG3
 YcRbC/Ic7XZ0+7eWoLcQ53eajZhIvEVw02S1dAx5wOfeYZgOT0p5C+7BVqQRu4E/u93JiCZwRxi
 NFFbgvg35AtVQ2K1ra3JO22hHCGHEe5+VIHb1LCK4se0m8JX97yApWplOoIBgmn84z67BYRh/H0
 wyL+Kx6CxKGfTzcSYVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_024901_349450_60A810DA 
X-CRM114-Status: GOOD (  25.03  )
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

On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > If a subdevice fails to stop, it indicates broken communication with the
> > DSP. Continuing to stop further subdevices against an unresponsive
> > remote processor could close rpmsg devices that could remove the memory
> > mapping from HLOS and in case if remote processor touches those memory
> > can result in SMMU fault.
> > 
> > Change rproc_stop_subdevices() to return int and abort on the first
> > failing subdev. Propagate the error through rproc_stop() and
> > __rproc_detach() so callers are aware the teardown did not complete
> > cleanly.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> But what would callers do about this? If you abort the teardown sequence
> half-way through you now have an inconsistent half-stopped state that
> neither a new call to stop() nor a new call to start() could recover
> from. That doesn't sound much better than the SMMU fault. Or am I
> missing something here?

SMMU fault result in device crash while other is non-functional remote
processor. From Linux side, we do not know the state of remote processor
when the timeout happens..cleaning the subdevices can result in the
debug data being lost for hung remote processor.

> 
> I would expect that we should either be able to tolerate the SMMU faults
> with the resets involved in the remoteproc stop/start sequence, or that
> DMA gets cancelled by the remoteproc stop sequence, before the buffers
> are unmapped. Perhaps the order of our stop sequence is just wrong? Can
> we unmap the buffers in the subdev unprepare() callback?


IMO, Sequence of subdevice is fine 

 glink-> sysmon-> ssr     start

 ssr -> sysmon-> glink    stop

glink subdevice gets cleared due to which this issue happens.., it will
not help as we are ignoring the timeout.


> Thanks,
> Stephan

-- 
-Mukesh Ojha

