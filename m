Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC365C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ltGb5qxPvD3jFiEXdQhEApOI6vDeU/ug2xf9ZQ5zRw=; b=2kgWR//MM/c7ZO
	CeLY94cMhA0rfRtn+3rH5yChLFPk8lbK3I8wyd09HeuwlTekgVOACMKwKNOgEUy288Jno68Dkqtry
	WCpYm9pHgo+nFsVAwZT8sOlK2fTyjvp5M1mu5tx8+Hfnum6HYPksQ0fl/pU7tJjCqy1Mtv0/V2cuy
	qgb3ct9xAYVRn5jzm3ft0B3OBF8WdMYPKet5/gw/ahjxNrHVKdyXzvl1NHxCZP2H1wZXRMVNXgaBq
	5Loz0cOFeNHNIi4vrubImURHZKXUsOeUfaGdVnTsaknUQpGiDZ1mvNyM1l+QCUONvflt4gKXj/cJf
	1FhZWtoDH7axgcuq0reA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rO2-0000000FqEZ-1lQC;
	Wed, 02 Sep 2026 20:16:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rO0-0000000FqEF-2f53
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:16:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqrfo1650582
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5ltGb5qxPvD3jFiEXdQhEA
	pOI6vDeU/ug2xf9ZQ5zRw=; b=eKIqNL8zw812M4XVaezWsTyGhGKXMfrRbULuqs
	STB+uGQF2UySTlmKjIkk2LEuaZcYiG7DaAqzWXPua8qQYe8dyQZIXxclFHBkK3kk
	Jr0RbVJx/gqW8In4Yc+c/PFjBmP2ixnl+CXA6d4Np+dp4S128jEW7qGihNdj42Fh
	dIjB5U77mofw8VKqbO5RO6FRHvERVQVFZ2bPbI/hEzastUGynIXIDkUOJV+zVTOD
	j+T9X6MtWmCswsa4/oXA/YwMXwio3BaQk0D9GM1uEA/6ggof63uPjb+adnN3Xcla
	EsM+VSTpjfjosu7eMkWNC0LlSk8Qn12Dc0zqvCra2xwsimJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4srmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:16:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e80ce3597so29666676d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380202; x=1788985002; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5ltGb5qxPvD3jFiEXdQhEApOI6vDeU/ug2xf9ZQ5zRw=;
        b=YHjRRnFTgU6QwIcZYjoZXpPGtLMbLREVA52Flde6mASCGe4aSgzeucPo8bz/UGsish
         tLwRu9j9F4HLB/3FLE9xYk+KvwHHJ5OxkNSLUUrZriZM50TdvZ/UkaGBvPgDPqvU6D8B
         pH5z0gXX1jtnkDYkDb7TlkJ/Pn4yYsMrvsO1QqbXFvja5EcziFxg6S4Tv4m0GN2/hvfT
         k+itMLtvnVjU4FwXoyk/rwEq4v4oJIH83WrvzsGMHFhrQ33GDK9QshQDP8XcnBjiJP6U
         NfJac0+E3lTioxAauII4e/fuyeEg7YuBJ3mzmQ/SRRKCPMYvV/NDOCU9SsiiOgombz3T
         9yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380202; x=1788985002;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5ltGb5qxPvD3jFiEXdQhEApOI6vDeU/ug2xf9ZQ5zRw=;
        b=qjAPRSfz9yk59G1yYu3SwKWFQohMEnkPOm2zk7wFGclFo3stl4M2pSS1B1RPBNxv9v
         porfvWOPAyqN+rEfojhAheUpwa11qrOeEX0i5jYFFytvn8r4S2LXXnFuNSRvjRX9AgkM
         Ul3p49wLY/TwShHmSD7YsvADL4EEYthJl7vtXJgMEvVJfrXUIyM368a+C5qE5vzI/m7C
         0xXlSlsT3ugiDofk12hsJ+6hbBBz0TI1F0hMFpKzbRqzfiaogeKMzsuaXkQ/dXnGCm26
         hp6JHlUcBuku4bhugoMVyqrYWDXEWsz9Y4zazjWR6Wt5ZhP+AbzrxveFf+HuzDyDzxJh
         VLfg==
X-Forwarded-Encrypted: i=1; AKwUvBzHS+doKZsckT69LR5KjkFUMlQKUkKtkfV1Yt8iynvTbsySzBrnnJvITcIPMIEAcwKXo3/XjJcyuvz+QDQ0GJlo@lists.infradead.org
X-Gm-Message-State: AFuF++lpRhqSLWhXKKvY2Nl11W5cMu/1WxX1y5If7w7QQkjURfj9lelv
	+sK7wbHVZIlspX3E5zmeQfq2UXKHABg80wbUFwnn5GXmuzecjB4uC88W33hpR+06m9Nva0Agd+j
	xODBANChKSWQO5SjKH4oivRIqIb+yX4osYV2oBSrWzTAjUFwiFW7AV9FiQR8+ovKco4MuWPehGc
	8ysA==
X-Gm-Gg: AYBFou1s7weZi29pupuQ/vbXDs06MUnE5RFcHp1MrI/+Jrz0pcA9SDnsI3Kzs8tZJ/V
	HriPONIWJfaeazHbhH6r4FTZz+8F5YZyw4mRbIO5awUpkk9PPgbRtP3TeTr9M8lyRfUOh5UUM7D
	3DLPYnP/3U+l08FGEX8FVNdjdvlNhRZcGgIUJnQCNsrOr/rv2dA7KdKEp9hhUSvepgUtD7HU7uY
	kzgZdNz0IDh0HFoZ5aK5QmWRadApVQqvl9ZFuiTLgzyHu11SljNf9uWyujZrzO3pop7apVowo0G
	m5p24s6uMjWzyQKis5uebBF9rmLx26KdbgYTtNhZFsIakYoK0r8aWO0ePDN9bLYoU2fRULupY5J
	H6af1S4sAmBHMCQ==
X-Received: by 2002:a05:620a:a80b:b0:930:a26a:fb2a with SMTP id af79cd13be357-93960cb8422mr878377685a.2.1788380202259;
        Wed, 02 Sep 2026 13:16:42 -0700 (PDT)
X-Received: by 2002:a05:620a:a80b:b0:930:a26a:fb2a with SMTP id af79cd13be357-93960cb8422mr878371285a.2.1788380201749;
        Wed, 02 Sep 2026 13:16:41 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea961sm8577632f8f.28.2026.09.02.13.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:16:40 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net v3 0/4] net: stmmac: re-apply taprio offload in
 __stmmac_open() and stmmac_resume()
Date: Wed, 02 Sep 2026 22:15:40 +0200
Message-Id: <20260902-stmmac-est-reapply-after-open-v3-0-e72a6df5a7ef@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNywqDMBAF0F+RrDtiYuOjq/5H6SLGsQbMo0kqF
 fHfG6SLLgpuBu5cOHclAb3CQC7ZSjzOKihrUihPGZGjMA8E1adMWMGqomFnCFFrIQFDBI/CuWk
 BMUT0YB0aoA3t60JQjl1FkuE8Duq9+zdiMJJ7eo4qROuXfXOme/Xl+QE/U6DQD6Ip6pJj2rnaE
 PLnS0zSap2nsw/M7Bdtj1CWUI5cyo42HFv2B9227QNL3Ub7KwEAAA==
X-Change-ID: 20260824-stmmac-est-reapply-after-open-181d70a15eb6
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>,
        Thierry Reding <treding@nvidia.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX0EokGP4+gQZZ
 YYc+1C56lcZ/xNdPVZ3ydgVkpN0jkOT6q5VZHGlP2T+YlSc/nMbDQK7SE2QB8u6xdtn/KWyyoU3
 IOkYx1nXa0jnd1JqGW961vBH2KD4ST1rD6fKWqxJwO4CfCf3/hPv1+G2KGJPWDL3LguMc7ptwRc
 CArcFxbgi9UUE05cpIWM1weh9HuP2CX8aqCOVbiFMEuUBWCZvmwITWCYm1V5VtEKcU1puiPzHgi
 /RnEzrk2b9Dl1r/UU9X/UxEx/Olm1Fl3LagGofRt8WF0FdYT5hpWCQFU3aySn0ToD4nGNbJa+Lq
 o1zrBHfQ/xEgVTph5uDNCZ317MKB6l+Z6pJ/kbbchwZqgh7+4BPLyCn2f56+ioEu0+EncaZyM/0
 rS/bre/RWzF1kiPd8DQUMYT0tiTqKGwPhojJoisMf5x+dywukgT9+F8ega6UMre90KOKt9YgwCf
 Em97JlxRMivOkA0QEhw==
X-Proofpoint-ORIG-GUID: sqw1iFW5IkML0qjf2-Mk6hHSABVyqNmf
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a98842a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=98BwIGCMshqbzBBwbswA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: sqw1iFW5IkML0qjf2-Mk6hHSABVyqNmf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXxod1L+f5M3jD
 QyMGdCOGIUPTAmZ7EITFIublKW3EaJTIcYA10xAgBWsM7nxMrIXUM2esUBmJiQc+FAVrVbWM4bx
 s3njwTGhsGqU6sP0rFwR6AaTgQ7JPX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131644_824910_33CBC235 
X-CRM114-Status: GOOD (  14.03  )
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


---
Changes in v3:
- Guard priv->est.enable update using est_lock mutex.
- Embed stmmac_est in stmmac_priv struct.
- Rework locking in tc_taprio_configure().
- Fix possible divided by zero crash in tc_taprio_configure().
- Add missing reconfiguration during stmmac_resume().
- Honor ptp error code in __stmmac_open() and stmmac_resume().
- Link to v2: https://lore.kernel.org/r/20260829-stmmac-est-reapply-after-open-v2-1-5e5ccb185e92@oss.qualcomm.com

Changes in v2:
- Rename stmmac_est_reconfigure() in stmmac_setup_est().
- Rely on stmmac_setup_est() in tc_taprio_configure().
- Link to v1: https://lore.kernel.org/r/20260825-stmmac-est-reapply-after-open-v1-1-dfa80735e0a1@oss.qualcomm.com

---
Lorenzo Bianconi (4):
      net: stmmac: propagate PTP init failures in stmmac_setup_ptp()
      net: stmmac: embed struct stmmac_est in stmmac_priv struct
      net: stmmac: pass the desired EST enable state to est_configure()
      net: stmmac: re-apply taprio offload in __stmmac_open() and stmmac_resume()

 drivers/net/ethernet/stmicro/stmmac/hwif.h        |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  |  36 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  |  13 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  76 ++++++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  41 ++-----
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 134 +++++++++++-----------
 7 files changed, 176 insertions(+), 128 deletions(-)
---
base-commit: f695390ea63941a9e412bf1f3afe65ab245fc681
change-id: 20260824-stmmac-est-reapply-after-open-181d70a15eb6

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


